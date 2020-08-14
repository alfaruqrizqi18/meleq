import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meleq/helper/color_app/color_app.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';
import 'package:meleq/helper/route_shortcut/route_shortcut.dart';
import 'package:meleq/pages/video/detail_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  Response response;
  Dio dio = new Dio();
  bool isReady = false;
  String urlToPlay = "";
  YoutubePlayerController _controller;

  getData() async {
    response =
        await dio.get("http://meleqapps.herokuapp.com/backend/api/video");
    if (response != null) {
      setState(() {
        isReady = true;
      });
    }
    print(response.data);
  }

  playVideo() {
    setState(() {
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(urlToPlay),
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    });
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
                            text: ' Video',
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
                      setState(() {
                        urlToPlay = response.data[index]['link'];
                      });
                      playVideo();
                      showQr(link: response.data[index]['link']);
//                    RouteShortcut().Push(context, DetailVideo(link: response.data[index]['link'],));
                    },
                    contentPadding: EdgeInsets.only(left: 30.0, right: 30.0),
                    title: Text(response.data[index]['link'],
                        style: TextStyle(
                            fontFamily: FontSetting.fontMain,
                            color: Colors.grey[500],
                            fontSize: 15)),
                    trailing: Icon(
                      Icons.play_circle_filled,
                      color: ColorApp.main_color_app,
                      size: 20,
                    ),
                  );
                }),
      ),
    );
  }

  void showQr({String link}) {
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
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7)),
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
