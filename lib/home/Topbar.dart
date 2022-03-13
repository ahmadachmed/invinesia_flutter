import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scannerapp/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/Group_2.svg",
            height: 20,
          ),
        ],
      ),
    );
  }
}
