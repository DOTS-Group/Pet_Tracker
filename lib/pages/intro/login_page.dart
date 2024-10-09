import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double heighgt = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.generalPadding,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: heighgt * SharedConstants.generalPadding,
                ),
                child: Text(
                  "Login Page",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
