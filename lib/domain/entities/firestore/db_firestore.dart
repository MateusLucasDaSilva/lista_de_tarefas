import 'package:cloud_firestore/cloud_firestore.dart';

class DBFirestore {
  DBFirestore._();

  static final _instance = DBFirestore._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DBFirestore._instance._firestore;
  }
}
