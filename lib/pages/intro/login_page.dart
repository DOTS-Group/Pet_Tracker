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
              // Header
              Text("Pet Takip’e Hoşgeldin"),
              Row(
                children: [
                  for (int i = 0; i < 3; i++)
                    i == 1
                        ? SizedBox(
                            width: width * SharedConstants.generalPadding,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(
                                heighgt * SharedConstants.generalPadding,
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.abc,
                                ),
                                Text(
                                  "Google",
                                ),
                              ],
                            ),
                          ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
