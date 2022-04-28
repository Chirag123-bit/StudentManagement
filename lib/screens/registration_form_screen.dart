// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../models/Student.dart';

class StudentRegistrationScreen extends StatefulWidget {
  const StudentRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<StudentRegistrationScreen> createState() =>
      _StudentRegistrationScreenState();
}

class _StudentRegistrationScreenState extends State<StudentRegistrationScreen> {
  final _globalkey = GlobalKey<FormState>();
  var student;
  String? fname, lname, batch, email;
  List<Student> listStudents = [];
  int newId = 0;

  addStudent(Student student) {
    setState(() {
      listStudents.add(student);
      print(listStudents.length);
      newId++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Registration Form"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _globalkey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      fname = value;
                    })
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    hintText: "First Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      lname = value;
                    })
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    hintText: "Last Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      batch = value;
                    })
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Batch",
                    hintText: "Batch",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      email = value;
                    })
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email Address",
                    hintText: "Email Address",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_globalkey.currentState!.validate()) {
                          student = Student(newId, fname, lname, batch, email);
                          addStudent(student);
                        }
                      },
                      child: const Text("Add Student")),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/students',
                            arguments: listStudents);
                      },
                      child: const Text("View Student")),
                )
              ],
            ),
          ),
        ));
  }
}
