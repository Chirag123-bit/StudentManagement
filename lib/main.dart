import 'package:flutter/material.dart';
import 'package:student_management/screens/MarkEntryScreen.dart';
import 'package:student_management/screens/ResultsScreen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MarkEntryScreen(),
        "/result": (context) => const ResultScreen(),
      },
    ),
  );
}
