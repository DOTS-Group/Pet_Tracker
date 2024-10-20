import 'package:flutter/material.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text("QR Code Page"),
        ],
      )),
    );
  }
}
