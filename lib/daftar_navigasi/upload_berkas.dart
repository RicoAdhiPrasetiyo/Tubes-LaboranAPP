import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:path/path.dart';
import 'package:tugas/model/api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Firebase Upload';
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: upload_berkas(),
      );
}

class upload_berkas extends StatefulWidget {
  @override
  _upload_berkasState createState() => _upload_berkasState();
}

class _upload_berkasState extends State<upload_berkas> {
  UploadTask? task;
  File? file;
  List<Map<String, dynamic>> data = [
    {'title': 'Screenshot Nilai Praktikum', 'value': false},
    {'title': 'Soft File KHS', 'value': false},
    {'title': 'Portfolio (Opsional)', 'value': false},
    {'title': 'Sertifikat / Penghargaan (Opsional)', 'value': false}
  ];

  @override
  Widget build(BuildContext context) {
    bool _terpilih = false;
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(6, 40, 6, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'UPLOAD BERKAS ANDA',
              style: TextStyle(
                  fontFamily: 'TimesNewRoman',
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            SizedBox(
              height: 80,
            ),
            SizedBox(height: 48),
            MaterialButton(
              color: Colors.orange,
              minWidth: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    type: FileType.custom,
                    allowedExtensions: ['pdf']);
                if (result == null) return;
                final path = result.files.single.path!;

                setState(() => file = File(path));
              },
              child: Text('Pilih File'),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              fileName,
            ),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.black87,
              minWidth: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              onPressed: uploadFile,
              child: Text(
                'UPLOAD FILE',
                style: TextStyle(color: Colors.white),
              ),
            ),
            task != null ? buildUploadStatus(task!) : Container(),
            Spacer(),
            Image.asset(
              'images/line.png',
            )
          ],
        ),
      ),
    );
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'Data Lab/$fileName';

    task = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}
