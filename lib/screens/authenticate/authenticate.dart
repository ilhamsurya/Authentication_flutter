import 'package:flutter/material.dart';
import 'package:profile/screens/authenticate/register.dart';
import 'package:profile/screens/authenticate/sign_in.dart';

class Authenticatite extends StatefulWidget {
  @override
  _AuthenticatiteState createState() => _AuthenticatiteState();
}

class _AuthenticatiteState extends State<Authenticatite> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
