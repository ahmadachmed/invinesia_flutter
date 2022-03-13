import 'package:flutter/material.dart';
import 'package:scannerapp/scanner/body.dart';

class Scanner extends StatelessWidget {
  static String routeName = "/scanner";
  const Scanner({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
