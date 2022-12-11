import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sanalira_app/model/user_model.dart';

abstract class IFirebaseService {
  Future<void> addUser(UserModel user);
}

class FirebaseService extends IFirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> addUser(UserModel user) {
    return users
        .add(user.toJson())
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }
}
