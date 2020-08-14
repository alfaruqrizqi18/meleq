import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meleq/pages/splashscreen/Splashscreen.dart';

import 'helper/hex_color/hex_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.white));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: HexColor("#FAFAFA"),
//      scaffoldBackgroundColor: HexColor("#F5F5F5"),
          scaffoldBackgroundColor: HexColor("#FFFFFF"),
          cardColor: HexColor("#FFFFFF"),
          tabBarTheme: TabBarTheme(
            unselectedLabelColor: Colors.grey,
          ),
          accentColor: Colors.blue,
          hintColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashscreenV1()));
  });
}
