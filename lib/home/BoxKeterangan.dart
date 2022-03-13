import 'package:flutter/material.dart';
import 'package:scannerapp/constants.dart';

class BoxKeterangan extends StatelessWidget {
  final int n;
  final String keterangan;
  const BoxKeterangan({
    Key key,
    this.n,
    this.keterangan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: primaryColor,
          width: 0.2,
        ),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '$n',
          style: Theme.of(context).textTheme.headline3,
          children: [
            TextSpan(
                text: '\n $keterangan',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
