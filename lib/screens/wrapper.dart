import 'package:flutter/material.dart';
import 'package:profile/models/user.dart';
import 'package:profile/profilpage.dart';
import 'package:profile/screens/authenticate/authenticate.dart';
import 'package:profile/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return home or authenticate
    if (user == null) {
      return Authenticatite();
    } else {
      return Home();
    }
  }
}
