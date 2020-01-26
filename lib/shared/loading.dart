import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[100],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.red[200],
          size: 50.0,
        ),
      ),
    );
  }
}
