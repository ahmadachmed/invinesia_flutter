import 'package:flutter/material.dart';
import 'package:scannerapp/components/defaultButton.dart';
import 'package:scannerapp/constants.dart';
import 'package:scannerapp/home/BoxKeterangan.dart';
import 'package:scannerapp/home/Picture.dart';
import 'package:scannerapp/home/Topbar.dart';
import 'package:scannerapp/scanner/scanner.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopBar(),
        Expanded(
          flex: 5,
          child: LandscapePicture(),
        ),
        SizedBox(height: defaultPadding / 2),
        Container(
          margin: EdgeInsets.only(
              top: defaultPadding,
              left: defaultPadding,
              bottom: defaultPadding / 2),
          child: Text(
            "WEDDING INVITATION",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding, right: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: BoxKeterangan(
                    n: 38,
                    keterangan: "hadir",
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                    child: BoxKeterangan(
                  n: 70,
                  keterangan: "konfirmasi",
                )),
                SizedBox(width: defaultPadding),
                Expanded(
                    child: BoxKeterangan(
                  n: 100,
                  keterangan: "undangan",
                )),
              ],
            ),
          ),
        ),
        DefaultButton(
          text: "Scan Barcode",
          press: () => Navigator.pushNamed(context, Scanner.routeName),
        ),
      ],
    );
  }
}
