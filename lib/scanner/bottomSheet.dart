import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:scannerapp/components/defaultButton.dart';
import 'package:scannerapp/home/home.dart';
import 'package:scannerapp/scanner/body.dart';

import '../constants.dart';

class CustBottomSheet extends StatefulWidget {
  final ExpectedScanResult item;
  const CustBottomSheet({
    Key key,
    this.item,
  }) : super(key: key);

  @override
  State<CustBottomSheet> createState() => _CustBottomSheetState();
}

class _CustBottomSheetState extends State<CustBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/icons/mail_send.svg'),
              SizedBox(height: defaultPadding / 2),
              Text(
                widget.item.type,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: defaultPadding),
              Text(
                "JAKARTA",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: defaultPadding / 2),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: DateFormat('MM/dd/yyyy \n hh:mm:ss')
                      .format(DateTime.now()),
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              DefaultButton(
                text: "Done",
                press: () => Navigator.pushNamed(context, Home.routeName),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
