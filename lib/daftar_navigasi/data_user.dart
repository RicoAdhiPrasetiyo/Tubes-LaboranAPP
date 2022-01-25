import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class user extends StatefulWidget {
  @override
  _userState createState() => _userState();
}

class _userState extends State<user> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Gagal Mengunggah Gambar : $e');
    }
  }

  File? file;
  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('user').snapshots();
  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(6, 80, 6, 6),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  child: InkWell(
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Ambil Gambar Profil'),
                            );
                          },
                        );
                      },
                      child: Icon(Icons.camera_alt_rounded)),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'User Profil',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'ArialRoundedMTBold',
                  ),
                ),
                Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: user,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Terdapat Kesalahan');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('Memuat Data User');
                      }

                      final data = snapshot.requireData;

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return Text(
                            '\n${data.docs[index]['Nama']}\n'
                            '${data.docs[index]['NIM']}\n'
                            '${data.docs[index]['Email']}\n'
                            '${data.docs[index]['Angkatan']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'ArialRoundedMTBold',
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';
  }
}
