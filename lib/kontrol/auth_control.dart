import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:tugas/daftar_navigasi/tentang.dart';
import 'package:tugas/halaman/halaman_daftar.dart';
import 'package:tugas/halaman/halaman_masuk.dart';
import 'package:tugas/halaman/halaman_pertama.dart';
import 'package:tugas/halaman/selamat_datang.dart';
import 'package:tugas/model/navigasi.dart';

class auth_control extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> streamauthstatus() {
    return auth.authStateChanges();
  }

  void masuk(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(navigasi());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Pengguna Tidak Ditemukan') {
        print('Email Tidak Terdaftar');
      } else if (e.code == 'Password Salah') {
        print('Email dan Password Tidak Cocok');
      }
    }
  }

  void daftar(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.to(halaman_pertama());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'Kata Sandi Lemah') {
        print('Kata Sandi Terlalu Lemah');
      } else if (e.code == 'Email Sudah Digunakan') {
        print('Email Sudah Digunakan');
      }
    } catch (e) {
      print(e);
    }
  }

  void keluar() async {
    await FirebaseAuth.instance.signOut();

    Get.to(Selamat_Datang());
  }
}
