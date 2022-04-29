// ignore: file_names
import 'package:flutter/material.dart';
import 'package:student_management/models/Student.dart';
import 'package:student_management/models/StudentMark.dart';

class MarkEntryScreen extends StatefulWidget {
  const MarkEntryScreen({Key? key}) : super(key: key);

  @override
  State<MarkEntryScreen> createState() => _MarkEntryScreenState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("28A"), value: "28A"),
    const DropdownMenuItem(child: Text("28B"), value: "28B"),
    const DropdownMenuItem(child: Text("28C"), value: "28C"),
  ];
  return menuItems;
}

class _MarkEntryScreenState extends State<MarkEntryScreen> {
  final _globalkey = GlobalKey<FormState>();
  var studentMark;
  String? name, batch, status;
  double? api, iot, web, total;
  double? percentage;
  List<StudentMark> listStudentsMark = [];
  String selectedValue = "28B";

  addStudent(student) {
    listStudentsMark.add(student);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Mark Entry Screen"),
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
                      name = value;
                    })
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    hintText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Name can not be empty";
                    }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: selectedValue,
                    items: dropdownItems,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      api = double.parse(value);
                    })
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "API Marks",
                    hintText: "API Marks ",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    if (int.parse(value) < 0 || int.parse(value) > 100) {
                      return "The Mark must be between 0 and 100";
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
                      iot = double.parse(value);
                    })
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "IOT Marks",
                    hintText: "IOT Marks",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    if (int.parse(value) < 0 || int.parse(value) > 100) {
                      return "The Mark must be between 0 and 100";
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
                      web = double.parse(value);
                    })
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Web Marks",
                    hintText: "Web Marks",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "The input box is empty";
                    }
                    if (double.parse(value) < 0 || double.parse(value) > 100) {
                      return "The Mark must be between 0 and 100";
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
                          total = (api! + web! + iot!);
                          percentage = total! / 3;
                          status = percentage! >= 50 ? "Pass" : "Fail";
                          studentMark = StudentMark(name, selectedValue, api,
                              iot, web, percentage, status);
                          addStudent(studentMark);
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
                        Navigator.pushNamed(context, '/result',
                            arguments: listStudentsMark);
                      },
                      child: const Text("View Results")),
                )
              ],
            ),
          ),
        ));
  }
}
