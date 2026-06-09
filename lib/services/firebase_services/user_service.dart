import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.id)
        .set(user.toJson());
  }

  Future<UserModel?> getUser(String uid) async {
    final doc =
        await _firestore.collection('users').doc(uid).get();

    if (!doc.exists) return null;

    return UserModel.fromJson(doc.data()!);
  }

  Future<void> updateUser(UserModel user) async {
    await _firestore
        .collection('users')
        .doc(user.id)
        .update(user.toJson());
  }
}
