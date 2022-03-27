import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/admin_page.dart';
import 'package:untitled1/student.dart';

import 'admin_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return runApp(
    MaterialApp(
      initialRoute: FirstScreen().id,
      routes: {
        FirstScreen().id: (context) => FirstScreen(),
        Admin().id: (context) => Admin(),
        Login().id: (context) => Login(),
      },
    ),
  );
}
