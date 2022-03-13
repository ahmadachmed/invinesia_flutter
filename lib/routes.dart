import 'package:flutter/widgets.dart';
import 'package:scannerapp/accessCode/accessCode.dart';
import 'package:scannerapp/home/home.dart';
import 'package:scannerapp/scanner/scanner.dart';

final Map<String, WidgetBuilder> routes = {
  AccessCode.routeName: (context) => AccessCode(),
  Home.routeName: (context) => Home(),
  Scanner.routeName: (context) => Scanner(),
};
