import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:meleq/helper/color_app/color_app.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';
import 'package:meleq/helper/reusable_widget/button.dart';
import 'package:meleq/helper/route_shortcut/route_shortcut.dart';
import 'package:meleq/pages/history/detail_modul.dart';
import 'package:meleq/pages/quiz/detail_quiz.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ListQuiz extends StatefulWidget {
  @override
  _ListQuizState createState() => _ListQuizState();
}

class _ListQuizState extends State<ListQuiz> {
  GlobalKey globalKey = new GlobalKey();
  Response response;
  Dio dio = new Dio();
  bool isReady = false;

  getData() async {
    response =
    await dio.get("https://meleqapps.000webhostapp.com/backend/api/kuis");
    if (response != null) {
      setState(() {
        isReady = true;
      });
    }
    print(response.data);
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Unable to open url : $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext ctx, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                elevation: 1,
                automaticallyImplyLeading: true,
                forceElevated: false,
                backgroundColor: Colors.white,
                snap: false,
                centerTitle: true,
                floating: false,
                pinned: true,
                titleSpacing: 1,
                leading: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  alignment: Alignment.center,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.keyboard_backspace,
                          size: 20.0,
                          color: Colors.grey,
                        )),
                  ),
                ),
                title: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'List',
                      style: TextStyle(
                          fontFamily: FontSetting.fontMain,
                          color: Colors.grey[500],
                          fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Kuis',
                            style: TextStyle(
                                fontFamily: FontSetting.fontMain,
                                color: ColorApp.main_color_app,
                                fontWeight: FontWeight.w900,
                                fontSize: 15)),
                      ],
                    )),
                actions: <Widget>[])
          ];
        },
        body: !isReady
            ? Center(
          child: Text('Mohon tunggu sebentar',
              style: TextStyle(
                  fontFamily: FontSetting.fontMain,
                  color: Colors.black54,
                  fontSize: 20)),
        )
            : ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: response.data.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                onTap: () {
                  showQr(
                      url: response.data[index]['url_file'],
                      name: response.data[index]['judul']
                  );
                },
                contentPadding: EdgeInsets.only(left: 30.0, right: 30.0),
                title: Text(response.data[index]['judul'],
                    style: TextStyle(
                        fontFamily: FontSetting.fontMain,
                        color: Colors.grey[500],
                        fontSize: 15)),
//                    subtitle: Text(response.data[index]['url_qrcode'],
//                        maxLines: 1,
//                        overflow: TextOverflow.ellipsis,
//                        style: TextStyle(
//                            fontFamily: FontSetting.fontMain,
//                            color: ColorApp.main_color_app,
//                            fontSize: 12)),
                trailing: Icon(
                  Icons.share,
                  color: Colors.grey[500],
                  size: 20,
                ),
              );
            }),
      ),
    );
  }
  Future<void> _captureAndSharePng(title) async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      await Share.file('Meleq App', 'esys.png', pngBytes, 'image/png', text: title);
    } catch(e) {
      print(e.toString());
    }
  }
  void showQr({String url, String name}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (builder) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.04,
                    left: MediaQuery.of(context).size.width * 0.05,
                    right: MediaQuery.of(context).size.width * 0.05),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(8)),
                child: Container(
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: RepaintBoundary(
                    key: globalKey,
                    child: QrImage(
                      data: url,
                      backgroundColor: Colors.white,
                      version: QrVersions.auto,
                      size: 150.0,
                    ),
                  ),
                ),),
              Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.01,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: FlatButton.icon(
                      color: Colors.white,
                      onPressed: (){
                        _captureAndSharePng(name);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          "Share",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: FontSetting.fontMain,
                              fontSize: 18,
                              color: Colors.grey
                          ),
                        ),
                      ),
                      icon: Icon(Icons.share, color: ColorApp.main_color_app, size: 20,),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.04,
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: FlatButton.icon(
                      color: Colors.white,
                      onPressed: (){
                        RouteShortcut().Push(context, DetailQuiz(url: url));
//                      _launchURL("https://docs.google.com/viewer?url=${url}");
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      label: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          "View",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: FontSetting.fontMain,
                              fontSize: 18,
                              color: Colors.grey
                          ),
                        ),
                      ),
                      icon: Icon(Icons.visibility, color: Colors.blue, size: 20,),
                    ),
                  ))
            ],
          );
        });
  }
}
