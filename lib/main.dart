import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas/halaman/halaman_daftar.dart';
import 'package:tugas/halaman/halaman_masuk.dart';
import 'package:tugas/halaman/halaman_pertama.dart';
import 'package:tugas/halaman/halaman_syarat.dart';
import 'package:tugas/kontrol/auth_control.dart';
import 'package:tugas/model/navigasi.dart';
import 'package:tugas/halaman/selamat_datang.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authc = Get.put(auth_control(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authc.streamauthstatus(),
      builder: (context, snapshot) {
        print(snapshot.data);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LABORAN APP',
          routes: {
            '/Selamat_Datang': (context) => Selamat_Datang(),
            '/halaman_daftar': (context) => halaman_daftar(),
            '/halaman_masuk': (context) => halaman_masuk(),
            '/halaman_pertama': (context) => halaman_pertama(),
            '/halaman_syarat': (context) => halaman_syarat(),
            '/navigasi': (context) => navigasi(),
          },
          theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.grey[200],
          ),
          home: Selamat_Datang(),
        );
      },
    );
  }
}
