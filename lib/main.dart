import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_management/screens/StudentListScreen.dart';
import 'package:student_management/screens/registration_form_screen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const StudentRegistrationScreen(),
        "/students": (context) => const StudentListScreen(),
      },
    ),
  );
}
