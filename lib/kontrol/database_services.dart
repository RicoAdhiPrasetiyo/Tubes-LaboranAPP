import 'package:cloud_firestore/cloud_firestore.dart';

class database_service {
  static CollectionReference laboranapp = Firestore.instance.collection('user');
}

class Firestore {
  static var instance;
}
