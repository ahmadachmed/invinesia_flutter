import 'package:flutter/material.dart';
import 'package:scannerapp/constants.dart';

class Upper extends StatelessWidget {
  const Upper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 20,
          ),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/icons/logo.png",
                  color: primaryColor,
                  height: 70,
                ),
                SizedBox(
                  height: 6,
                ),
                Text("GUESTBOOK", style: Theme.of(context).textTheme.headline5)
              ],
            ),
          ),
        ),
        Container(
          child: Image.asset("assets/icons/flower.png"),
        ),
      ],
    );
  }
}
