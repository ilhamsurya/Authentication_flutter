import 'package:flutter/material.dart';
import 'package:profile/models/student.dart';
import 'package:profile/profilpage.dart';
import 'package:profile/screens/home/setting_form.dart';
import 'package:profile/screens/home/students_list.dart';
import 'package:profile/services/auth.dart';
import 'package:profile/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _selectedPage = 0;
  final _pageOptions = [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ];

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    void _showProfilePanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: ProfilePage(),
            );
          });
    }

    return StreamProvider<List<Student>>.value(
      value: DatabaseService().students,
      child: Scaffold(
          backgroundColor: Colors.blueAccent[50],
          appBar: AppBar(
            title: Text('Testing Mangga'),
            backgroundColor: Colors.deepOrange[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.clear),
                label: Text(''),
                onPressed: () async {
                  await _auth.SignOut();
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.account_circle),
                label: Text(''),
                onPressed: () => _showSettingsPanel(),
              ),
              FlatButton.icon(
                icon: Icon(Icons.photo),
                label: Text(''),
                onPressed: () => _showProfilePanel(),
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://iphonewalls.net/wp-content/uploads/2016/08/Cute%20Cats%20Vertical%20Aligned%20Illustration%20iPhone%206%20Wallpaper-320x480.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: StudentsList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
              ),
            ],
          )),
    );
  }
}
