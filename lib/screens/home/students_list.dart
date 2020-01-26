import 'package:flutter/material.dart';
import 'package:profile/models/student.dart';
import 'package:profile/screens/home/student_tile.dart';
import 'package:provider/provider.dart';

class StudentsList extends StatefulWidget {
  @override
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  @override
  Widget build(BuildContext context) {
    final students = Provider.of<List<Student>>(context);

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return StudentTile(student: students[index]);
      },
    );
  }
}
