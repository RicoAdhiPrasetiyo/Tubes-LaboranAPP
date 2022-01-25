import 'dart:ffi';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

class halaman_pertama extends StatelessWidget {
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
            Image.asset(
              'images/welcome.png',
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'SELAMAT DATANG',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'RighteousRegular',
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'di',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'RighteousRegular',
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                'LABORAN APP',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'RighteousRegular',
                  color: Colors.orange[700],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/halaman_syarat');
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(86, 20),
                  primary: Colors.grey[200],
                  onPrimary: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
            ),
          ].reversed.toList(),
        ),
      ),
    );
  }
}
