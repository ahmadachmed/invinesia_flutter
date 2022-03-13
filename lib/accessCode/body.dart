import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scannerapp/constants.dart';
import 'package:scannerapp/home/home.dart';

import 'Numpads.dart';
import 'Upper.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> currentCode = ["", "", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();

  var outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.transparent),
  );

  int pinIndex = 0;

  pinIndexSetup(String text) {
    if (pinIndex == 0)
      pinIndex = 1;
    else if (pinIndex < 5) pinIndex++;
    setPin(pinIndex, text);
    currentCode[pinIndex - 1] = text;
    String strPin = "";
    currentCode.forEach((e) {
      strPin += e;
    });
    if (pinIndex == 5) ;
    print(strPin);
  }

  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
      case 5:
        pinFiveController.text = text;
        Navigator.pushNamed(context, Home.routeName);
      //break;
    }
  }

  clearPin() {
    if (pinIndex == 0)
      pinIndex = 0;
    else if (pinIndex == 5) {
      setPin(pinIndex, "");
      currentCode[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentCode[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Upper(),
        SizedBox(height: defaultPadding / 2),
        Text(
          "Masukkan Kode Akses",
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(height: defaultPadding / 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PINNumber(
                textEditingController: pinOneController,
                outlineInputBorder: outlineBorder),
            PINNumber(
                textEditingController: pinTwoController,
                outlineInputBorder: outlineBorder),
            PINNumber(
                textEditingController: pinThreeController,
                outlineInputBorder: outlineBorder),
            PINNumber(
                textEditingController: pinFourController,
                outlineInputBorder: outlineBorder),
            PINNumber(
                textEditingController: pinFiveController,
                outlineInputBorder: outlineBorder),
          ],
        ),
        SizedBox(
          height: defaultPadding,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Numpads(
                    n: 1,
                    onPressed: () {
                      pinIndexSetup("1");
                    },
                  ),
                  Numpads(
                    n: 2,
                    onPressed: () {
                      pinIndexSetup("2");
                    },
                  ),
                  Numpads(
                    n: 3,
                    onPressed: () {
                      pinIndexSetup("3");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Numpads(
                    n: 4,
                    onPressed: () {
                      pinIndexSetup("4");
                    },
                  ),
                  Numpads(
                    n: 5,
                    onPressed: () {
                      pinIndexSetup("5");
                    },
                  ),
                  Numpads(
                    n: 6,
                    onPressed: () {
                      pinIndexSetup("6");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Numpads(
                    n: 7,
                    onPressed: () {
                      pinIndexSetup("7");
                    },
                  ),
                  Numpads(
                    n: 8,
                    onPressed: () {
                      pinIndexSetup("8");
                    },
                  ),
                  Numpads(
                    n: 9,
                    onPressed: () {
                      pinIndexSetup("9");
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(width: 80, child: SizedBox()),
                  Numpads(
                    n: 0,
                    onPressed: () {
                      pinIndexSetup("0");
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    child: MaterialButton(
                      onPressed: () {
                        clearPin();
                      },
                      child: Icon(Icons.arrow_back_ios_new_sharp),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: defaultPadding),
        Text(
          "Request Kode Akses",
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  PINNumber({this.textEditingController, this.outlineInputBorder});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: EdgeInsets.only(right: defaultPadding / 3, top: defaultPadding),
      child: TextField(
          controller: textEditingController,
          enabled: false,
          obscureText: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(defaultPadding / 5),
            border: outlineInputBorder,
          ),
          style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
