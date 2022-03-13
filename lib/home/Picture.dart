import 'package:flutter/material.dart';

class LandscapePicture extends StatelessWidget {
  const LandscapePicture({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.asset(
        "assets/images/images1.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
