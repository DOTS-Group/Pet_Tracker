import 'package:flutter/material.dart';

class RenewPassword extends StatelessWidget {
  const RenewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(
        child: Column(
          children: [
            Text('Renew Password'),
          ],
        ),
      ),
    );
  }
}
