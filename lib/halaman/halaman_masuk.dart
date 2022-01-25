import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'package:tugas/halaman/halaman_pertama.dart';
import 'dart:convert';
import 'dart:async';

import 'package:tugas/kontrol/auth_control.dart';
import 'package:tugas/model/navigasi.dart';

class halaman_masuk extends StatelessWidget {
  final email = TextEditingController();
  final password = TextEditingController();
  final authc = Get.find<auth_control>();
  bool signin = true;
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = MediaQueryHeight - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(6, 20, 6, 0),
        height: bodyHeight * 1,
        child: ListView(
          shrinkWrap: true,
          reverse: true,
          padding: EdgeInsets.all(28.0),
          children: [
            SizedBox(
              height: 5,
            ),
            Image.asset(
              'images/masuk.png',
              width: 240,
              height: 240,
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              width: 20.0,
              child: TextField(
                controller: email,
                autocorrect: false,
                showCursor: true,
                cursorHeight: 20,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 20.0,
              child: TextField(
                controller: password,
                autocorrect: false,
                showCursor: true,
                cursorHeight: 20,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => authc.masuk(email.text, password.text),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 20),
                  primary: Colors.orange[700],
                  onPrimary: Colors.black87,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'MASUK',
                  style: TextStyle(
                    fontFamily: 'ArialRoundedMTBold',
                    fontSize: 23.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/navigasi');
                  },
                  child: Text(
                    "Cek Isi APP",
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '________________________________________',
                style: TextStyle(
                  fontFamily: 'ArialRoundedMTBold',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Belum Punya Akun?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/halaman_daftar');
                  },
                  child: Text(
                    " KLIK DISINI",
                    style: TextStyle(
                      color: Colors.purple[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100,
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
