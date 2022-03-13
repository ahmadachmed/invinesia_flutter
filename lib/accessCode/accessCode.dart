import 'package:flutter/material.dart';
import 'package:scannerapp/accessCode/body.dart';

class AccessCode extends StatefulWidget {
  static String routeName = "/accessCode";

  @override
  State<AccessCode> createState() => _AccessCodeState();
}

class _AccessCodeState extends State<AccessCode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}
