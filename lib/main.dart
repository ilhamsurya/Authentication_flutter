import 'package:flutter/material.dart';
import 'package:profile/models/user.dart';
import 'package:profile/profilpage.dart';
import 'package:profile/screens/wrapper.dart';
import 'package:profile/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
        ));
  }
}
