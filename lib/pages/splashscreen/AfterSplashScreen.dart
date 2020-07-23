import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';
import 'package:meleq/helper/hex_color/hex_color.dart';
import 'package:meleq/helper/reusable_widget/button.dart';
import 'package:meleq/helper/route_shortcut/route_shortcut.dart';
import 'package:meleq/pages/homepage.dart';

class AfterSplashScreen extends StatefulWidget {
  @override
  _AfterSplashScreenState createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset(
                "assets/images/illustrations/coach_monochromatic.png",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "Dampak Kependudukan Bangsa Barat di Kediri Jawa Timur Dalam Bidang Sosial, Ekonomi, Politik, Budaya dan Pendidikan.",
                    style: TextStyle(
                        color: HexColor("#5A5A5A"),
                        fontFamily: FontSetting.fontMain,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 0.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    "KD 4.3 Menalar dampak politik, budaya, sosial, ekonomi dan pendidikan pada masa penjajahan bangsa Eropa (Portugis, Spanyol, Belanda, Inggris) dalam kehidupan bangsa Indonesia masa kini dan menyajikannya dalam bentuk cerita sejarah",
                    style: TextStyle(
                        color: HexColor("#5A5A5A"),
                        fontFamily: FontSetting.fontMain,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: PButton().MainButton("Selanjutnya", () {
                  SystemChrome.setEnabledSystemUIOverlays(
                      SystemUiOverlay.values);
                  RouteShortcut().PushReplacement(context, Homepage());
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
