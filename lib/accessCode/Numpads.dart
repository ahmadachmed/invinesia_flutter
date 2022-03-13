import 'package:flutter/material.dart';

import '../constants.dart';

class Numpads extends StatelessWidget {
  final int n;
  final Function() onPressed;
  const Numpads({
    Key key,
    this.n,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      alignment: Alignment.center,
      // margin: EdgeInsets.only(
      //    left: defaultPadding, right: defaultPadding, top: defaultPadding),
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        child: Text(
          "$n",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Lato",
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              color: primaryColor),
        ),
      ),
    );
  }
}
