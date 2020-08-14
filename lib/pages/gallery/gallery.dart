import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:meleq/helper/color_app/color_app.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  Response response;
  Dio dio = new Dio();
  bool isReady = false;

  getData() async {
    response =
        await dio.get("http://meleqapps.herokuapp.com/backend/api/gallery");
    if (response != null) {
      setState(() {
        isReady = true;
      });
    }
    print(response.data);
  }

  List<String> images = [
    'https://cdn.tmpo.co/data/2019/12/23/id_900024/900024_720.jpg',
    'https://statik.tempo.co/data/2019/12/23/id_900027/900027_720.jpg',
    'https://zadinda.files.wordpress.com/2014/08/img_2896.jpg',
    'https://zadinda.files.wordpress.com/2014/08/img_2936.jpg',
    'https://cdn.tmpo.co/data/2019/12/23/id_900024/900024_720.jpg',
    'https://statik.tempo.co/data/2019/12/23/id_900027/900027_720.jpg',
    'https://zadinda.files.wordpress.com/2014/08/img_2896.jpg',
    'https://zadinda.files.wordpress.com/2014/08/img_2936.jpg',
    'https://cdn.tmpo.co/data/2019/12/23/id_900024/900024_720.jpg',
    'https://statik.tempo.co/data/2019/12/23/id_900027/900027_720.jpg',
    'https://zadinda.files.wordpress.com/2014/08/img_2896.jpg',
    'https://zadinda.files.wordpress.com/2014/08/img_2936.jpg',
    'https://cdn.tmpo.co/data/2019/12/23/id_900024/900024_720.jpg',
    'https://statik.tempo.co/data/2019/12/23/id_900027/900027_720.jpg',
    'https://zadinda.files.wordpress.com/2014/08/img_2896.jpg',
    'https://zadinda.files.wordpress.com/2014/08/img_2936.jpg',
  ];
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
                      margin: EdgeInsets.only(left: 15.0),
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
                          text: 'Galeri',
                          style: TextStyle(
                              fontFamily: FontSetting.fontMain,
                              color: Colors.grey[500],
                              fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: '',
                                style: TextStyle(
                                    fontFamily: FontSetting.fontMain,
                                    color: ColorApp.main_color_app,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18)),
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
                : ListView.separated(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: response.data.length,
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemBuilder: (ctx, index) {
                      return Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.only(right: 0.0, top: 20, bottom: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                child: CachedNetworkImage(
                                  imageUrl: response.data[index]['url_file'],
                                  placeholder: (context, url) => Container(
                                    child: Loading(
                                      indicator: BallScaleIndicator(),
                                      size: 24,
                                      color: ColorApp.main_color_app,
                                    ),
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.width *
                                        0.85,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.85,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey[200]),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    height: MediaQuery.of(context).size.width *
                                        0.50,
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
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
//                                Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.75,
//                                  child: Text(
//                                    "Apakah kamu sudah tau sejarah Gereja Merah Kediri?",
//                                    style: TextStyle(
//                                        fontFamily: FontSetting.fontMain,
//                                        fontSize: 15,
//                                        fontWeight: FontWeight.bold),
//                                    textAlign: TextAlign.left,
//                                    maxLines: 2,
//                                    overflow: TextOverflow.ellipsis,
//                                  ),
//                                  margin: EdgeInsets.only(
//                                      right: 20.0,
//                                      left: 5,
//                                      top: 10.0,
//                                      bottom: 5.0),
//                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    response.data[index]['judul'],
                                    style: TextStyle(
                                        fontFamily: FontSetting.fontMain,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey),
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  margin: EdgeInsets.only(
                                      right: 20.0, left: 5, top: 10.0),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    })
//      GridView.builder(
//              padding: EdgeInsets.zero,
//              physics: BouncingScrollPhysics(),
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                //TOTAL GRID DALAM 1 BIDANG, MISAL 3 MAKA AKAN BERISI 3 ELEMENT KEKANAN DAN ELEMEN KE-4 AKAN DISIMPAN DIBAWAHNYA SECARA OTOMATIS
//                crossAxisCount: 3,
//                mainAxisSpacing: 1, //MENGATUR JARAK ANTARA OBJEK ATAS DAN BAWAH
//                crossAxisSpacing:
//                    1, //MENGATUR JARAK ANTARA OBJEK KIRI DAN KANAN
//                childAspectRatio: 1.0, //ASPEK RASIONYA KITA SET BANDING 1 SAJA
//              ),
//              itemCount: response.data.length,
//              itemBuilder: (ctx, index) {
//                return Container(
//                  child: CachedNetworkImage(
//                    imageUrl: response.data[index]['url_file'],
//                    fit: BoxFit.cover,
//                    placeholder: (ctx, index) => Container(
//                      width: 24,
//                      height: 24,
//                      alignment: Alignment.center,
//                      child: Loading(
//                        size: 18,
//                        color: ColorApp.main_color_app,
//                        indicator: BallPulseIndicator(),
//                      ),
//                    ),
//                  ),
//                );
//              }),
            ));
  }
}
