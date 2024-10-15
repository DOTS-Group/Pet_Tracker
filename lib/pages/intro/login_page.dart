import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/shared/list_shared.dart';

import '../../widgets/generalbutton_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double heighgt = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: Column(
          children: [
            // Header
            Text(
              "Pet Takip’e Hoşgeldin",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            // Other Login Buttons
            Row(
              children: [
                for (int i = 0; i < 3; i++)
                  i == 1
                      ? SizedBox(
                          width: width * SharedConstants.paddingGenerall,
                        )
                      : Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: i == 0
                                  ? SharedList.loginOtherLoginButtonList[0]
                                      .backgroundColor
                                  : SharedList.loginOtherLoginButtonList[1]
                                      .backgroundColor,
                              borderRadius: BorderRadius.circular(
                                heighgt * SharedConstants.paddingGenerall,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical:
                                    heighgt * SharedConstants.paddingSmall,
                                horizontal:
                                    width * SharedConstants.paddingGenerall,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    i == 0
                                        ? SharedList
                                            .loginOtherLoginButtonList[0].icon
                                        : SharedList
                                            .loginOtherLoginButtonList[1].icon,
                                    color: i == 0
                                        ? SharedList
                                            .loginOtherLoginButtonList[0]
                                            .iconColor
                                        : SharedList
                                            .loginOtherLoginButtonList[1]
                                            .iconColor,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: width *
                                          SharedConstants.paddingGenerall,
                                    ),
                                    child: Text(
                                      i == 0
                                          ? SharedList
                                              .loginOtherLoginButtonList[0].text
                                          : SharedList
                                              .loginOtherLoginButtonList[1]
                                              .text,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: i == 0
                                                ? SharedList
                                                    .loginOtherLoginButtonList[
                                                        0]
                                                    .textColor
                                                : SharedList
                                                    .loginOtherLoginButtonList[
                                                        1]
                                                    .textColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
              ],
            ),
            // Or Text
            Text(
              "veya e posta ile giriş",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            // Remember Me and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text(
                      "Beni Hatırla",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                Text(
                  "Şifremi Unuttum",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            // Login Button
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: heighgt * SharedConstants.paddingGenerall,
              ),
              child: GeneralButtonWidget(
                text: "🐾 Başla",
                textColor: Colors.white,
                backgroundColor: Colors.amber,
                route: "/pattern",
              ),
            ),
            // Register
            RichText(
              text: TextSpan(
                text: "Hesabın yok mu? ",
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: "Kayıt Ol",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.amber,
                        ),
                  ),
                ],
              ),
            ),
            // Privacy Policy
            Padding(
              padding: EdgeInsets.only(
                top: heighgt * SharedConstants.paddingGenerall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 2; i++)
                    Text(
                      i == 0 ? "S.S.S" : "K.V.K.K",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
