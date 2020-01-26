import 'package:flutter/material.dart';
import 'package:profile/models/student.dart';

class StudentTile extends StatelessWidget {
  final Student student;
  StudentTile({this.student});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Color(0xff476cfb),
              child: ClipOval(
                child: new SizedBox(
                  width: 180.0,
                  height: 180.0,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=727&q=80",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            title: Text(student.name),
            subtitle: Text('Alamat: ${student.alamat}'),
          ),
        ));
  }
}
