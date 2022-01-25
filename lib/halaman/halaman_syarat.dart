import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class halaman_syarat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = MediaQueryHeight - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(6, 40, 6, 0),
        height: bodyHeight * 1,
        child: ListView(
          shrinkWrap: true,
          reverse: true,
          padding: EdgeInsets.all(28.0),
          children: [
            Text(
              'Syarat - syarat\n'
              'Pendaftaran Sebagai Calon\n'
              'Asisten Lab Elektro',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'TimesNewRoman',
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Text(
              '______________________________________________',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'ArialRoundedMTBold',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '1. Mahasiswa Aktif Elektro UMM (Min 2 '
              'Tahun \n    Sebelumnya).\n'
              '2. Nilai IP Terakhir diatas 3.00.\n'
              '3. Sudah Melaksanakan Praktikum terkait \n'
              '4. Mampu Mengatur Waktu denga Baik.\n'
              '5. Nilai Praktikum Terakhir (B+).\n'
              '6. Di - prioritaskan Tidak Ikut Organanisasi\n'
              '    Lain.\n'
              '7. Memiliki Minat Belajar yang Tinggi.\n'
              '8. Jujur, Amanah, Rajin, dan Bekerja dalam\n'
              '    Tim.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Arimo',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '     Dan Jangan Lupa Siapkan Berkas - berkas\n'
              '     Pendukung, Seperti....',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              '1. Screenshot Nilai Akhir Praktikum yang\n'
              '    bersangkutan.\n'
              '2. Soft File KHS (Kartu Hasil Studi) terakhir.\n'
              '3. Portofolio (Opsional)\n'
              '4. Sertifikat / Penghargaan (Opsional)',
              style: TextStyle(
                fontFamily: 'Arimo',
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [Container()],
            ),
            Center(
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/navigasi');
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(70, 10),
                    primary: Colors.grey[200],
                    onPrimary: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_outlined,
                        size: 20,
                        color: Colors.black87,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '_________________',
              style: TextStyle(
                color: Colors.grey[200],
              ),
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
