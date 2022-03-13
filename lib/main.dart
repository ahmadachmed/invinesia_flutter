import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scannerapp/accessCode/accessCode.dart';
import 'package:scannerapp/constants.dart';

import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Lato",
        primaryColor: primaryColor,
        textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 12, color: primaryColor),
            headline5: TextStyle(fontSize: 24, color: primaryColor),
            headline6: TextStyle(fontSize: 14, color: primaryColor),
            headline3: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      ),
      initialRoute: AccessCode.routeName,
      routes: routes,
    );
  }
}
