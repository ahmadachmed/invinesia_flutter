import 'package:flutter/material.dart';

import '../constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          top: defaultPadding / 2,
          bottom: defaultPadding / 2),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => primaryColor),
        ),
        child: Text(text),
        onPressed: press,
      ),
    );
  }
}
