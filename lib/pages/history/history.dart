import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:meleq/helper/color_app/color_app.dart';
import 'package:meleq/helper/font_setting/font_setting.dart';
import 'package:meleq/helper/route_shortcut/route_shortcut.dart';
import 'package:meleq/pages/history/list_modul.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
                      text: 'Sejarah ',
                      style: TextStyle(
                          fontFamily: FontSetting.fontMain,
                          color: Colors.grey[500],
                          fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Gereja Merah Kediri',
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
        body: ListView(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
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
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        margin: EdgeInsets.only(
                            right: 20.0, left: 5, top: 10.0, bottom: 10.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          "Gereja Immanuel atau yang dikenal dengan Gereja Merah terletak di jalan KDP Slamet nomor 43 Kediri, wilayah adminitratif Kelurahan Bandar Lor RT 1/ RW 1 Kecamatan Mojoroto Kota Kediri Propinsi Jawa Timur, pada koordinat 122°00’16’’ Bujur Timur 07°48’43’’ Lintang Selatan, pada ketinggian 63 meter di atas permukaan laut (GPS Garmin 48). \n\nGereja Immanuel cukup dikenal oleh kalangan masyarakat Kota Kediri dan sekitarnya dengan sebutam Gereja Merah karena dindingnya bercat merah, sehingga tidak sulit menemukannya. Di dekat pintu masuk komplek gereja dipasang papan nama yang cukup besar.\n\nSejarah tentang benih iman di tanah Kediri diawali oleh Dominus J.A. Broers yang berkenan menorehkan tanda tangannya di atas prasati berbahasa Belanda “De Eerste Steen gelegd door Ds. J.A. Broers, 21 Dec 1904 J.V.D. Dungen Gronovius Fecit” artinya “Peletakan batu pertama oleh Dominus (pdt) J.A. Gronovius”. \n\nItulah gedung untuk “Kerkeraad der Protestantche Gemeente te Kediri”, berasitektur Eropa dengan kapasitas 200 orang. Sesuai nama “ Kerkeraad der Protestancthe Gemeente te Kediri”, Jemaat Protestan yang beromisili di Kediri dan sekitarnya adalah orang-orang Belanda yang terdiri dari Belanda asli dari segi keturunan dan Belanda Blasteran. Mereka berkerja diberbagai sektor, antara lain Pemerintahan, Pabrik Gula Ngadirejo, Pesantren, Mrican, dan Kertosono (Wawancara Bapak Rekso (58th)). \n\nSebagaimana daerah lain pada masa Hindia Belanda pendeta yang mengurusi rohani orang Belanda diutus langsung oleh Pemerintah, demikian pula dengan J. A. Broers, yang menandatangani prasasti peletakan batu pertama. Ada bukti otentik bahwa sampai dengan tahun 1940-an, Pdt. Broers masih aktif mengembalakan jemaat di Gereja ini, yaitu surat baptis Bapak Hendrik Weeda, putra dari pasangan Tn. Cornelis Johannes Weeda dengan Ny. Dora Elsje Gaillard, tertanggal 5 Desember 1932. Semangat pelayanan yang tinggi dari Pdt. Broers memotivasi orang-orang Bumiputera untuk mengikuti Jesus sehingga setiap tahun jemaat “Gereja Protestan Jemaat Kediri “ semakin bertambah (BP3 Jatim (2005); Wawancara Bapak Rekso (58th)). \n\nSementara Pdt. Broers tekun menjalankan peninggalannya sebagai Gembala Sidang di “ Kerkeraad der Protestancthe Gemeente te Kediri”. Pendeta lain yang bertugas di Gereja masing-masing, selain tekun mengembala jemaatnya, juga mengevaluasi kebijakan pemerintah Hindia Belanda atas Gereja yang mereka layani. Kebijakan tersebut antara lain pendeta yang berstatus pegawai negeri, pendeta yang hanya dari kalangan orang Belanda atau negara Eropa lainnya, pendeta yang program kerjanya sudag digariskan oleh Belanda. Akses bagi orang Bumiputera masih sulit sebab status tertinggi di gereja bagi mereka adalah Guru Injil. \n\nGedung itu dikelola oleh Bumiputera Bersahaja, sebagaimana disebutkan bahwa beberapa gereja tidak melebur eksistensinya dengan salah satu dari tiga gereja yang sudah ada 49 jumlahnya. “Kerkeraad der Protestancthe Gemeente te Kediri”, ternyata merupakan satu dari 49 gereja yang diserahkan, tepatnya no urut  ke-39. Maka pada tahun 1948 itu juga namanya lebih mengindonesia menjadi GPIB Jemaat “ Immanuel” ( BP3 Jatim, 2005).Para jemaat yang bersahaja dalam melayani Tuhan tetap berjuang melanjutkan karya agung Pdt. Broers karena telah menabur dengan duka, maka akan bergembira dalam menuai hasilnya. \n\nGuna meneguhkan iman, maka pelayanan firman dari Mojokerto atau Madiun yaitu Pendeta Konsuler. Tapi dia orang benar selalu didengarkan oleh Tuhan, sehingga pada tahun 1974 Majelis Sinode GPIB menempatkan seorang pendeta sebagai pelayan tetap di Gereja ini. Bahkan lima tahun sebelumnya mereka telah mendapat berkat karena berdasarkan Surat keputusan Kepala Direktur Jendral Agraria No. SK. 222/DDA/1969, tanggal 14 maret 1969 Gedung ini resmi menjadi hak milik GPIB sebagai sarana Ibadah. \n\nSeiring perkembangan jumlah jemaat, para pendeta yang bertugas selalu berusaha menampilkan fisik gereja ke arah yang lebih baik, Maka perkembangan demi perkembangan dan perubahan demi perubahan sanantiasa dicatat secara cermat. \n\nTujuannya adalah agar jemaat atau siapapun yang dengan niat baik ingin mengetahui sejarah gedung ini tidak terlalu sulit untuk menemukan keasliannya. Pucuk dicinta ulam tiba, para pendeta melestarika keaslian Gedung ini sesungguhnya karena terdorong oleh nilai sejarahnya, namun ia menjadi gedung berharga ketika pemerintah Indonesia mengundangkan  Undang-undang No.5 tahun 1992 tentang benda Cagar Budaya dimana gedung-gedung seusia gereja ini harus dilindungi karena telah menyimpan nilai-nilai budaya yang berharga (BP3 Jatim, 2005)",
                          style: TextStyle(
                              fontFamily: FontSetting.fontMain,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
//                          textAlign: TextAlign.left,
                        ),
                        margin: EdgeInsets.only(right: 20.0, left: 5),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 15.0, right: 15.0),
        child: FloatingActionButton(
          onPressed: () {
            RouteShortcut().Push(context, ListModul());
          },
          elevation: 1,
          backgroundColor: ColorApp.main_color_app,
          child: Icon(Icons.assignment_returned),
        ),
      ),
    );
  }
}
