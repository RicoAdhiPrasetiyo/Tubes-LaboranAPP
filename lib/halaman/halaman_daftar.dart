import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixel_perfect/pixel_perfect.dart';
import 'dart:async';
import 'dart:convert';

import 'package:tugas/kontrol/auth_control.dart';

class halaman_daftar extends StatelessWidget {
  var Nama = '';
  var NIM = '';
  var Angkatan = '';
  var Email = '';
  var Password = '';

  final email = TextEditingController();
  final password = TextEditingController();
  final nama = TextEditingController();
  final angkatan = TextEditingController();
  final nim = TextEditingController();
  final authc = Get.find<auth_control>();
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = MediaQueryHeight - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 60, 30, 2),
        height: bodyHeight * 1,
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          reverse: true,
          children: [
            Center(
              child: Image.asset(
                'images/daftar.png',
                width: 160,
                height: 160,
              ),
            ),
            SizedBox(
              height: 0,
            ),
            TextFormField(
              controller: nama,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                labelText: "Nama",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
              onChanged: (value) {
                Nama = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                labelText: "Email",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
              onChanged: (value) {
                Email = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: angkatan,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                labelText: "Angkatan",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
              onChanged: (value) {
                Angkatan = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: nim,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                labelText: "NIM",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
              onChanged: (value) {
                NIM = value;
              },
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              obscureText: true,
              controller: password,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                labelText: "Password",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
              ),
              onChanged: (value) {
                Password = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: new ElevatedButton(
                onPressed: () {
                  authc.daftar(
                    email.text,
                    password.text,
                  );
                  user
                      .add(
                        {
                          'Nama': Nama,
                          'NIM': NIM,
                          'Angkatan': Angkatan,
                          'Email': Email,
                          'Password': Password
                        },
                      )
                      .then(
                        (value) => print('Pendaftaran Berhasil'),
                      )
                      .catchError(
                        (error) => print('Pendaftaran Gagal: $error'),
                      );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(140, 10),
                  primary: Colors.black87,
                  onPrimary: Colors.orange[700],
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'DAFTAR',
                  style: TextStyle(
                    fontFamily: 'ArialRoundedMTBold',
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '_________________________________________',
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
                  "Sudah Mendaftar?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/halaman_masuk');
                  },
                  child: Text(
                    " MASUK",
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
