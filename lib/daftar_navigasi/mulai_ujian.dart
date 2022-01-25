import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class dataujian extends StatefulWidget {
  @override
  _dataujianState createState() => _dataujianState();
}

class _dataujianState extends State<dataujian> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final bodyHeight = MediaQueryHeight - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(6, 80, 6, 0),
        height: bodyHeight * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    '____________________',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'ArialRoundedMTBold',
                        color: Colors.grey[200]),
                  ),
                  Text(
                    'PILIH BIDANG MINAT PRAKTIKUM',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'UNTUK MEMULAI UJIAN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    '____________________',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'ArialRoundedMTBold'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 140,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/body');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange[700],
                      onPrimary: Colors.black87,
                    ),
                    child: Text('REGULER'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/body');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange[700],
                      onPrimary: Colors.black87,
                    ),
                    child: Text('SISTEM TENAGA LISTRIK'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/body');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange[700],
                      onPrimary: Colors.black87,
                    ),
                    child: Text('TELEMATIKA'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/body');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange[700],
                      onPrimary: Colors.black87,
                    ),
                    child: Text('ELEKTRONIKA'),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    '____________________',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'ArialRoundedMTBold',
                        color: Colors.grey[200]),
                  ),
                  Text(
                    '____________________',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'ArialRoundedMTBold',
                        color: Colors.grey[200]),
                  ),
                  Text(
                    '____________________',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'ArialRoundedMTBold',
                        color: Colors.grey[200]),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('images/new_umm.png'),
                  ),
                  Text(
                    '____________________',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'ArialRoundedMTBold',
                        color: Colors.grey[200]),
                  ),
                  Text(
                    '____________________',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'ArialRoundedMTBold',
                        color: Colors.grey[200]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
