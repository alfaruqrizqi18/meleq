import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';
import 'package:meleq/helper/hex_color/hex_color.dart';
import 'package:meleq/helper/reusable_widget/button.dart';
import 'package:meleq/helper/route_shortcut/route_shortcut.dart';
import 'package:meleq/pages/homepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AfterSplashScreen extends StatefulWidget {
  @override
  _AfterSplashScreenState createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  int page_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (val) {
                    setState(() {
                      page_index = val;
                    });
                  },
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/illustrations/coach_monochromatic.png",
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Dampak Kependudukan Bangsa Eropa (Portugis, Spanyol, Belanda, dan Inggris) dalam kehidupan Bangsa Indonesia masa kini. ",
                                style: TextStyle(
                                    color: HexColor("#5A5A5A"),
                                    fontFamily: FontSetting.fontMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 20.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "KD 3.3 Menganalisis dampak politik, budaya, sosial, ekonomi, dan pendidikan pada masa penjajahan Bangsa Eropa ( Portugis, Spanyol, Belanda, Inggris) dalam kehidupan Bangsa Indonesia masa kini.",
                                style: TextStyle(
                                    color: HexColor("#5A5A5A"),
                                    fontFamily: FontSetting.fontMain,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/illustrations/startup.png",
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Indikator",
                                style: TextStyle(
                                    color: HexColor("#5A5A5A"),
                                    fontFamily: FontSetting.fontMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 20.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Menganalisis buku teks siswa, E-Modul dan melihat video serta gambar-gambar Gereja Merah sebagai hasil dari dampak politik, budaya,sosial, ekonomi dan pendidikan pada masa penjajahan Bangsa Eropa ( Portugis, Spanyol, Belanda, Inggris) dalam kehidupan Bangsa Indonesia masa kini\n\nMembentuk kelompok diskusi untuk mengidentifikasi mengenai Gereja Merah sebagai hasil dari dampak politik, budaya,sosial, ekonomi dan pendidikan pada masa penjajahan Bangsa Eropa ( Portugis, Spanyol, Belanda, Inggris) dalam kehidupan Bangsa Indonesia masa kini\n\nMengeksplorasi hasil diskusi kelompok mengenai Gereja Merah sebagai hasil dari dampak politik, budaya,sosial, ekonomi dan pendidikan pada masa penjajahan Bangsa Eropa ( Portugis, Spanyol, Belanda, Inggris) dalam kehidupan Bangsa Indonesia masa kini",
                                style: TextStyle(
                                    color: HexColor("#5A5A5A"),
                                    fontFamily: FontSetting.fontMain,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30.0),
                      child: ListView(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/illustrations/data_analytics__monochromatic.png",
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 20.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Tujuan",
                                style: TextStyle(
                                    color: HexColor("#5A5A5A"),
                                    fontFamily: FontSetting.fontMain,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 20.0),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Aplikasi Meleq ini dikembangkan guna mempermudah proses pembelajaran dan menambah variasi bahan ajar yang dapat digunakan siswa untuk memahami materi Dampak Kependudukan Bangsa Eropa di Indonesia. Serta memperkenalkan Sejarah Lokal yang ada di Kabupaten Kediri",
                                style: TextStyle(
                                    color: HexColor("#5A5A5A"),
                                    fontFamily: FontSetting.fontMain,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: SmoothPageIndicator(
                    controller: PageController(initialPage: page_index),
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: WormEffect(
                        spacing: 8.0,
                        radius: 20.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        dotColor: Colors.grey[100],
                        activeDotColor: HexColor("#FF7676")),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        // width: MediaQuery.of(context).size.width * 0.7,
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: PButton().MainButton("Selanjutnya", () {
          SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
          RouteShortcut().PushReplacement(context, Homepage());
        }),
      ),
    );
  }
}
