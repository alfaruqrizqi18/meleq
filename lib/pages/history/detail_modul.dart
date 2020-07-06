import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:meleq/helper/color_app/color_app.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';

class DetailModul extends StatefulWidget {
  final String url;

  const DetailModul({Key key, this.url}) : super(key: key);


  @override
  _DetailModulState createState() => _DetailModulState();
}

class _DetailModulState extends State<DetailModul> {
  PDFDocument doc;
  bool is_loading;


  getPDF() async {
    setState(() {
      is_loading = true;
    });
    doc = await PDFDocument.fromURL("https://meleqapps.000webhostapp.com/assets/uploads/"+widget.url);
    setState(() {
      is_loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          centerTitle: true,
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
                text: 'Detail',
                style: TextStyle(
                    fontFamily: FontSetting.fontMain,
                    color: Colors.grey[500],
                    fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Materi}',
                      style: TextStyle(
                          fontFamily: FontSetting.fontMain,
                          color: ColorApp.main_color_app,
                          fontWeight: FontWeight.w900,
                          fontSize: 15)),
                ],
              )),
          actions: <Widget>[]),
      body: Center(
          child: is_loading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: doc)),
    );
  }
}
