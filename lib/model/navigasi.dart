import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/circular_reveal_clipper.dart';
import 'dart:math' as math;
import 'package:tugas/daftar_navigasi/data_user.dart';
import 'package:tugas/daftar_navigasi/mulai_ujian.dart';
import 'package:tugas/daftar_navigasi/tentang.dart';
import 'package:tugas/daftar_navigasi/upload_berkas.dart';
import 'package:tugas/halaman/halaman_masuk.dart';
import 'package:tugas/kontrol/auth_control.dart';

class navigasi extends StatefulWidget {
  @override
  _navigasiState createState() => _navigasiState();
}

class _navigasiState extends State<navigasi> {
  final auth = Get.find<auth_control>();
  int currenTab = 0;
  final List<Widget> screens = [
    user(),
    dataujian(),
    tentang(),
    upload_berkas(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = tentang();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.shade400,
        child: Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            currentScreen = dataujian();
            currenTab = 0;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = tentang();
                        currenTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          size: 35,
                          color: currenTab == 0
                              ? Colors.black
                              : Colors.orange.shade700,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  MaterialButton(
                    minWidth: 35,
                    onPressed: () {
                      setState(() {
                        currentScreen = upload_berkas();
                        currenTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.upload,
                          size: 35,
                          color: currenTab == 0 ? Colors.black : Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //Tampilan Kanan code dibawah
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MaterialButton(
                    minWidth: 35,
                    onPressed: () {
                      setState(() {
                        currentScreen = user();
                        currenTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 35,
                          color: currenTab == 0 ? Colors.black : Colors.orange,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () => auth.keluar(),
                    icon: Icon(
                      Icons.logout,
                      size: 32,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
