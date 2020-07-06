import 'dart:typed_data';
import 'dart:ui';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meleq/helper/color_app/color_app.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class AppsQrCode extends StatefulWidget {
  @override
  _AppsQrCodeState createState() => _AppsQrCodeState();
}

class _AppsQrCodeState extends State<AppsQrCode> {
  GlobalKey globalKey = new GlobalKey();
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> _captureAndSharePng(title) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      await Share.file('Meleq App', 'esys.png', pngBytes, 'image/png',
          text: title);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  data:
                      "https://drive.google.com/file/d/1l-97o6rdfwfZprNMKwLbkcmKZskFAnWJ/view?usp=sharing",
                  backgroundColor: Colors.white,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
            ),
            Container(
              child: Text(
                "Bagikan Meleq App kepada teman-teman di sekitarmu ya",
                style: TextStyle(
                    fontFamily: FontSetting.fontMain,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(right: 20.0, left: 20, top: 20.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
//                    margin: EdgeInsets.only(left: 20.0),
                    alignment: Alignment.center,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {
                        _captureAndSharePng("Ayo download Meleq Apps!");
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.share,
                            size: 26.0,
                            color: ColorApp.main_color_app,
                          )),
                    ),
                  ),
                  Container(
//                    margin: EdgeInsets.only(left: 20.0),
                    alignment: Alignment.center,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () async {
                        String cameraScanResult = await scanner.scan();
                        if (cameraScanResult.toString().isNotEmpty) {
                          _launchURL(cameraScanResult);
                        }
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          child: Icon(
                            Icons.center_focus_weak,
                            size: 26.0,
                            color: Colors.blue,
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
