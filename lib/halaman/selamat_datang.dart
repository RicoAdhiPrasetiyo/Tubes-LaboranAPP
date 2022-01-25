import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class Selamat_Datang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = MediaQueryHeight -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Container(
        height: bodyHeight * 12,
        child: ListView(
          shrinkWrap: true,
          reverse: true,
          padding: EdgeInsets.fromLTRB(40, 20, 40, 10),
          children: [
            Center(
              child: Text(
                "LABORAN APP",
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'RighteousRegular',
                  color: Colors.orange[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Center(
              child: Text(
                "Recruit an assistant lab",
                style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'BrushScriptMT',
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Image.asset(
              'images/Selamat_Datang.png',
              width: 220,
              height: 220,
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/halaman_daftar');
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black87,
                  onPrimary: Colors.orange[700],
                  minimumSize: Size(160, 36),
                  elevation: 4,
                  padding: EdgeInsets.symmetric(
                    horizontal: 45,
                  )),
              child: Text("DAFTAR",
                  style: TextStyle(
                    fontFamily: 'ArialRoundedMTBold',
                    fontSize: 23.5,
                  )),
            ),
            SizedBox(
              height: 2,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/halaman_masuk');
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange[700],
                  onPrimary: Colors.black87,
                  minimumSize: Size(160, 36),
                  elevation: 4,
                  padding: EdgeInsets.symmetric(
                    horizontal: 49,
                  )),
              child: Text("MASUK",
                  style: TextStyle(
                    fontFamily: 'ArialRoundedMTBold',
                    fontSize: 23.5,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'images/Elektro_UMM.png',
              width: 120,
              height: 120,
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
