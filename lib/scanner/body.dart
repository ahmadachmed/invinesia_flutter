import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scannerapp/constants.dart';

import 'bottomSheet.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class ExpectedScanResult {
  final String type;

  ExpectedScanResult(this.type);
}

class _BodyState extends State<Body> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  final recognisedCodes = <ExpectedScanResult>[
    ExpectedScanResult('Ahmad Ilham'),
    ExpectedScanResult('@ahmadachmed'),
    ExpectedScanResult('INVINESIA'),
    ExpectedScanResult('Manusia Biasa Yang Datang Dan Pergi'),
  ];

  QRViewController _controller;
  Barcode barcode;

  bool _flashOn = false;
  bool _frontCam = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await _controller.pauseCamera();
    }
    await _controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        buildQrView(context),
        Positioned(bottom: 10, child: buildResult()),
        Align(
          alignment: Alignment.bottomCenter,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  _flashOn ? Icons.flash_on : Icons.flash_off,
                  color: primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _flashOn = !_flashOn;
                  });
                  _controller.toggleFlash();
                },
              ),
              IconButton(
                icon: Icon(
                  _frontCam ? Icons.camera_front : Icons.camera_rear,
                  color: primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    _frontCam = !_frontCam;
                  });
                  _controller.flipCamera();
                },
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.close,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildResult() => Container(
        decoration: BoxDecoration(
          color: barcode != null ? Colors.white24 : Colors.transparent,
        ),
        child: Text(
          barcode != null ? 'Result: ${barcode.code}' : '',
          maxLines: 3,
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          overlayColor: Colors.white.withOpacity(0.8),
          borderColor: primaryColor,
          borderRadius: 4,
          borderWidth: 6,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    this._controller = controller;
    final expectedCodes = recognisedCodes.map((e) => e.type);
    controller.scannedDataStream.listen(
      (barcode) {
        if (expectedCodes.any((element) => barcode.code == element)) {
          reassemble();
          showModalBottomSheet(
            isScrollControlled: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            backgroundColor: Colors.white,
            context: context,
            builder: (BuildContext context) {
              return CustBottomSheet(
                item: recognisedCodes
                    .firstWhere((element) => element.type == barcode.code),
              );
            },
          );
        } else if (expectedCodes.any((element) => barcode.code != element)) {
          reassemble();
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            backgroundColor: Colors.white,
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Text("Undangan tidak terdaftar sebagai tamu"),
              );
            },
          );
        }
      },
    );
  }
}
