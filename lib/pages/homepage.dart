import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:meleq/helper/color_app/color_app.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';
import 'package:meleq/helper/hex_color/hex_color.dart';
import 'package:meleq/helper/route_shortcut/route_shortcut.dart';
import 'package:meleq/pages/apps_qrcode.dart';
import 'package:meleq/pages/gallery/gallery.dart';
import 'package:meleq/pages/history/history.dart';
import 'package:meleq/pages/quiz/quiz.dart';
import 'package:meleq/pages/video/video.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
//                leading: Container(
//                  alignment: Alignment.center,
//                  decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                  ),
//                  child: GestureDetector(
//                    onTap: () {
//                      RouteShortcut().Push(context, AccountPage());
//                    },
//                    child: CircleAvatar(
//                      radius: 15,
//                      backgroundImage: NetworkImage(
//                          'https://voxpop.id/wp-content/uploads/2018/09/patrick-ok.jpg'),
//                    ),
//                  ),
//                ),
                title: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Meleq',
                      style: TextStyle(
                          fontFamily: FontSetting.fontMain,
                          color: Colors.grey[500],
                          fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' App',
                            style: TextStyle(
                                fontFamily: FontSetting.fontMain,
                                color: ColorApp.main_color_app,
                                fontWeight: FontWeight.w900,
                                fontSize: 18)),
                      ],
                    )),
                actions: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15.0, left: 5.0),
                      alignment: Alignment.center,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () async {
                          RouteShortcut().Push(context, AppsQrCode());
//                          String cameraScanResult = await scanner.scan();
//                          if(cameraScanResult.toString().isNotEmpty) {
//                            _launchURL(cameraScanResult);
//                          }
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.center_focus_weak,
                              size: 20.0,
                              color: ColorApp.main_color_app,
                            )),
                      ),
                    ),
                ])
          ];
        },
        body: ListView(
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 0.0, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://statik.tempo.co/data/2019/12/23/id_900027/900027_720.jpg",
                        placeholder: (context, url) => Container(
                          child: Loading(
                            indicator: BallScaleIndicator(),
                            size: 24,
                            color: ColorApp.main_color_app,
                          ),
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.width * 0.50,
                          width: MediaQuery.of(context).size.width * 0.85,
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          height: MediaQuery.of(context).size.width * 0.50,
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: MediaQuery.of(context).size.width * 0.50,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Icon(
                            Icons.error,
                            size: 24,
                            color: Colors.red[300],
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          "Apakah kamu sudah tau sejarah Gereja Merah Kediri?",
                          style: TextStyle(
                              fontFamily: FontSetting.fontMain,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: EdgeInsets.only(
                            right: 20.0, left: 5, top: 10.0, bottom: 5.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          "Sejarah Gereja Merah Kediri di bangun pada awal tahun 2e 9912 123",
                          style: TextStyle(
                              fontFamily: FontSetting.fontMain,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        margin: EdgeInsets.only(right: 20.0, left: 5),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15.0),
//              color: Colors.grey,
              child: GridView(
                padding: EdgeInsets.only(
                    left: 25.0, right: 25.0, top: 10.0, bottom: 0.0),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.9,

//                  childAspectRatio: 0.6,
                ),
                children: <Widget>[
                  buildUpperMenu(
                      HexColor("#FFFFFF"),
                      "assets/images/icon/history.png",
                      "Sejarah Gereja Merah",
                      () {
                        RouteShortcut().Push(context, History());
                      },
                      false),
                  buildUpperMenu(
                      HexColor("#FFFFFF"),
                      "assets/images/icon/pin.png",
                      "Lokasi Gereja Merah",
                      () {
                        _launchURL("https://goo.gl/maps/APBbaCYDn2c9mRks5");
                      },
                      false),
                  buildUpperMenu(HexColor("#FFFFFF"),
                      "assets/images/icon/image.png", "Galeri", () {
                    RouteShortcut().Push(context, Gallery());
                      }, false),
                  buildUpperMenu(HexColor("#FFFFFF"),
                      "assets/images/icon/question.png", "Kuis", () {
                    RouteShortcut().Push(context, ListQuiz());
                      }, false),
                  buildUpperMenu(HexColor("#FFFFFF"),
                      "assets/images/icon/video.png", "Video", () {
                    RouteShortcut().Push(context, Video());
                      }, false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildUpperMenu(HexColor cardColor, String imageAssets, String title,
      Function f, bool isFromNetwork) {
    return Container(
      child: InkWell(
        onTap: f,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
//                  border: Border.all(color: borderColor, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 15,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(10.5),
                  child: isFromNetwork
                      ? CachedNetworkImage(
                          imageUrl: imageAssets,
                          width: 25,
                          height: 25,
                        )
                      : Image.asset(
                          imageAssets,
                          width: 35,
                          height: 35,
                        ),
                ),
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(12),
//                    side: BorderSide(width: 0.1, color: Colors.grey)),
//                elevation: 2.0,
              ),
              Container(
                width: 80,
                padding: EdgeInsets.only(top: 5, right: 2, left: 2),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
//                  overflow: TextOverflow.ellipsis,
//                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 10,
                      fontFamily: FontSetting.fontMain,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget itemSquare({String urlImage, String title, Function f}) {
    return Container(
//      margin: EdgeInsets.only(right: 10.0, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              f();
            },
            child: CachedNetworkImage(
              imageUrl: urlImage,
              placeholder: (context, url) => Container(
                child: Loading(
                  indicator: BallScaleIndicator(),
                  size: 24,
                  color: ColorApp.main_color_app,
                ),
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              imageBuilder: (context, imageProvider) => Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                child: Icon(
                  Icons.error,
                  size: 24,
                  color: Colors.red[300],
                ),
              ),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: FontSetting.fontMain,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(
                    right: 0.0, left: 0, top: 10.0, bottom: 5.0),
              )
            ],
          )
        ],
      ),
    );
  }
}
