// ignore: file_names
import 'package:flutter/material.dart';
import 'package:student_management/models/Student.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  // ignore: unused_field
  static const IconData delete = IconData(0xe1b9, fontFamily: 'MaterialIcons');
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    List<Student> lstStudents =
        ModalRoute.of(context)!.settings.arguments as List<Student>;

    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        lstStudents.remove(context);
      },
    );

    Widget cancleButton = TextButton(
      child: const Text("Cancle"),
      onPressed: () {},
    );

    // ignore: prefer_const_constructors
    AlertDialog alert = AlertDialog(
        title: const Text("Delete Confirmation"),
        content: const Text("Are you sure you want to delete this record?"),
        actions: [okButton, cancleButton]);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Student List"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          Text('FName', textAlign: TextAlign.center),
                          Text('LName', textAlign: TextAlign.center),
                          Text('Batch', textAlign: TextAlign.center),
                          Text('Email', textAlign: TextAlign.center),
                          Text('Actions', textAlign: TextAlign.center),
                          // Text(student.fname.toString()),
                        ],
                      ),
                    ),
                  ]),
                  for (var student in lstStudents)
                    TableRow(children: [
                      TableCell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(student.fname.toString(),
                                textAlign: TextAlign.center),
                            Text(student.lname.toString(),
                                textAlign: TextAlign.center),
                            Text(student.batch.toString(),
                                textAlign: TextAlign.center),
                            Text(student.email.toString(),
                                textAlign: TextAlign.center),
                            TextButton.icon(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              icon: const Icon(delete),
                              label: const Text("Delete"),
                            )
                          ],
                        ),
                      ),
                    ])
                ])));
  }
}
