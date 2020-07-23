import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meleq/helper/color_app/color_app.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';
import 'package:meleq/helper/route_shortcut/route_shortcut.dart';
import 'package:meleq/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AfterSplashScreen.dart';

class SplashscreenV1 extends StatefulWidget {
  @override
  _SplashscreenV1State createState() => _SplashscreenV1State();
}

class _SplashscreenV1State extends State<SplashscreenV1> {
  bool is_logged_in = false;
  bool is_guest = false;
  String token = "";
  SharedPreferences prefs;
//  get_status_login() async {
//    prefs = await SharedPreferences.getInstance();
//    setState(() {
//      if (prefs.getBool(SPKey.is_logged_in) != null) {
//        if (prefs.getBool(SPKey.is_logged_in)) {
//          is_logged_in = true;
//        } else {
//          is_logged_in = false;
//        }
//      }
//      if (prefs.getBool(SPKey.is_guest) != null) {
//        if (prefs.getBool(SPKey.is_guest)) {
//          is_guest = true;
//        } else {
//          is_guest = false;
//        }
//      }
//    });
//  }
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
//    get_status_login();
    timeout();
  }

  Future<Timer> timeout() async {
    return new Timer(Duration(milliseconds: 2000), goToAfterSplashScreen);
  }

  onDoneLoading() async {
    is_logged_in || is_guest ? go_to_main_page() : goToAfterSplashScreen();
  }

  goToAfterSplashScreen() {
    RouteShortcut().PushReplacement(context, AfterSplashScreen());
  }

  go_to_onboarding() {
//    RouteShortcut().PushReplacement(context, OnBoardingPage());
  }

  go_to_main_page() {
    // WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    RouteShortcut().PushReplacement(context, Homepage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(
        "assets/images/logo/base-logo.png",
        width: 120.0,
      )
//        RichText(
//            textAlign: TextAlign.center,
//            text: TextSpan(
//              text: 'Meleq',
//              style: TextStyle(
//                  fontFamily: FontSetting.fontMain,
//                  color: Colors.grey[500],
//                  fontSize: 22),
//              children: <TextSpan>[
//                TextSpan(
//                    text: ' App',
//                    style: TextStyle(
//                        fontFamily: FontSetting.fontMain,
//                        color: ColorApp.main_color_app,
//                        fontWeight: FontWeight.w900,
//                        fontSize: 22)),
//              ],
//            )),
          ),
    );
  }
}
