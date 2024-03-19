import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/database/model/user_model.dart' as my_user;
import 'package:todo_app/database/users_dao.dart';

class AuthProviderClass extends ChangeNotifier {
  User? userFirebase;
  my_user.User? userDatabase;

  Future<void> register(
      String email, String password, String fullName, String userName) async {
    final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await UserDao.createUser(
      my_user.User(
        id: result.user?.uid,
        fullName: fullName,
        userName: userName,
        email: email,
      ),
    );
  }

  Future<void> login(String email, String password) async {
    final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    var user = await UserDao.getUser(result.user!.uid);

    userDatabase = user;
    userFirebase = result.user;
  }

  void logout() {
    userDatabase = null;
    FirebaseAuth.instance.signOut();
  }
}
