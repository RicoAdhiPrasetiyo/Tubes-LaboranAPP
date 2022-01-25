import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:tugas/kontrol/auth_control.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class tentang extends StatefulWidget {
  @override
  _tentangState createState() => _tentangState();
}

class _tentangState extends State<tentang> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = MediaQueryHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(8, 20, 8, 0),
        height: bodyHeight * 1,
        child: ListView(
          shrinkWrap: true,
          reverse: false,
          children: [
            Text(
              'LABORATORIUM\nTEKNIK ELEKTRO',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'TimesNewRoman',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(
              'UNIVERSITAS MUHAMMADIYAH MALANG',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'TimesNewRoman',
                  fontWeight: FontWeight.bold,
                  color: Colors.red[800],
                  fontSize: 20),
            ),
            Text(
              'Jalan Raya Tlogomas No. 246 Tlogomas, '
              'Babatan, Tegalgondo, Kec. '
              'Lowokwaru, Kota Malang, Jawa Timur 65144',
              textAlign: TextAlign.center,
            ),
            Text(
              '___________________________________',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'ArialRoundedMTBold',
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'images/lab.png',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'INFORMASI',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'TimesNewRoman',
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '     Lab Teknik Elektro mempunyai 4 pilihan praktikum yang dapat disesuaikan dengan jadwal '
              'atau mata kuliah yang telah diambil. '
              '4 Praktikum tersebut adalah Reguler, Bidang Sistem Tenaga Listrik, Bidang Telematika, dan Bidang Elektronika '
              ' Pada tiap bidang mempunyai beberapa praktikum yang dapat diambil. '
              ' Namun untuk mahasiswa yang ingin mendaftar menjadi calon Asisten Laboratorium, '
              'diwajibkan sudah melaksanakan praktikum yang bersangkutan.\n'
              '\nBerikut adalah praktikum yang sudah tergolong dalam masing - masing bidang :',
              textAlign: TextAlign.justify,
              style: TextStyle(fontFamily: 'TimesNewRoman'),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '- Praktikum Reguler :',
              style: TextStyle(
                fontFamily: 'TimesNewRoman',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('  1. Dasar Pemrograman Komputer\n'
                '  2. Dasar Sistem Komunikasi\n'
                '  3. Rangkaian Listrik I\n'
                '  4. Rangkaian Digital\n'
                '  5. Elektronika\n'
                '  6. Instalasi Listrik\n'
                '  7. Sistem Instrumentasi\n'
                '  8. Elektronika Analog\n'
                '  9. Mikrokontroller\n'
                '  10. Sistem Kontrol\n'),
            SizedBox(
              height: 5,
            ),
            Text(
              '- Bidang Sistem Tenaga Listrik',
              style: TextStyle(
                fontFamily: 'TimesNewRoman',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('  1. Mesin - Mesin Listrik\n'
                '  2. Elektronika Daya\n'
                '  3. Analisis Sistem Tenaga 2\n'
                '  4. Komputasi Cerdas\n'
                '  5. Programmable Logic Control\n'),
            SizedBox(
              height: 5,
            ),
            Text(
              '- Bidang Telematika',
              style: TextStyle(
                fontFamily: 'TimesNewRoman',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('  1. Pemrograman Berorientasi Objek I\n'
                '  2. Jaringan Komputer Lanjut\n'
                '  3. Embedded System\n'
                '  4. Keamanan & Manajemen Jaringan\n'
                '  5. Pemrograman Mobile\n'),
            SizedBox(
              height: 5,
            ),
            Text(
              '- Bidang Elektronika',
              style: TextStyle(
                fontFamily: 'TimesNewRoman',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('  1. Elektronika Industri\n'
                '  2. Pengolahan Citra Digital\n'
                '  3. Perancangan Sistem Berbasis FPGA\n'
                '  4. Perancangan Komponen Terprogram\n'
                '  5. Programmable Logic Control\n'),
            Text(
                '     Untuk mahasiswa yang ingin mendaftar sebagai Asisten Laboratorium Teknik Elektro, '
                'dapat melihat referensi daftar praktikum sesuai bidang yang sudah tertera diatas '
                'dan selanjutnya mahasiswa menyesuaikan dengan bidang yang telah diambil.',
                textAlign: TextAlign.justify),
            SizedBox(
              height: 20,
            ),
            Text(
              'CONTACT',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'TimesNewRoman',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Call Center : +62 8128 0075 857"),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.grey[200],
                  onPressed: () {
                    launch('https://www.instagram.com/elektroummlab/');
                  },
                  child: SvgPicture.asset(
                    'icon/ig.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.grey[200],
                  onPressed: () {
                    launch(
                        'https://www.youtube.com/channel/UCn0BCYotodi5SOo_f4Wr0-g');
                  },
                  child: SvgPicture.asset(
                    'icon/ytb.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
                FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.grey[200],
                  onPressed: () {
                    launch('https://lab-elektro.umm.ac.id/');
                  },
                  child: SvgPicture.asset(
                    'icon/net.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
