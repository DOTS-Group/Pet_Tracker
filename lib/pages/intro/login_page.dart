import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/models/splash%20intro%20login/form_model.dart';

import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/shared/list_shared.dart';

import '../../widgets/generalbutton_widget.dart';
import '../../widgets/intro/login/faqgdprbuttons_widget.dart';
import '../../widgets/intro/login/loginormethodbutton_widget.dart';
import '../../widgets/intro/login/rememberandforgetpassword_widget.dart';
import '../../widgets/intro/login/textform_widget.dart';
import '../../widgets/intro/login/welcomemessage_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<LoginFormModel> modelList = [
      LoginFormModel(
        leadingIcon: SharedList.loginPageTextFormIconList[0],
        hintText: context.tr('emailExample'),
        isPasswordForm: false,
        controller: TextEditingController(),
      ),
      LoginFormModel(
        leadingIcon: SharedList.loginPageTextFormIconList[1],
        hintText: context.tr('passwordExample'),
        isPasswordForm: true,
        controller: TextEditingController(),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Header Image
              Image.asset(
                SharedConstants.logoImageRoute,
                height: height * 0.2,
              ),
              // Welcome Messages
              const LoginPageWelcomeMessageWidget(),
              // Other Login Buttons
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                ),
                child: Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      i == 1
                          ? SizedBox(
                              width: width * SharedConstants.paddingGenerall,
                            )
                          : Expanded(
                              child: LoginorMethodButtonWidget(
                                backgroundColor: i == 0
                                    ? SharedList.loginOtherLoginButtonList[0]
                                        .backgroundColor
                                    : SharedList.loginOtherLoginButtonList[1]
                                        .backgroundColor,
                                icon: i == 0
                                    ? SharedList
                                        .loginOtherLoginButtonList[0].icon
                                    : SharedList
                                        .loginOtherLoginButtonList[1].icon,
                                iconColor: i == 0
                                    ? SharedList
                                        .loginOtherLoginButtonList[0].iconColor
                                    : SharedList
                                        .loginOtherLoginButtonList[1].iconColor,
                                text: i == 0
                                    ? SharedList
                                        .loginOtherLoginButtonList[0].text
                                    : SharedList
                                        .loginOtherLoginButtonList[1].text,
                                textColor: i == 0
                                    ? SharedList
                                        .loginOtherLoginButtonList[0].textColor
                                    : SharedList
                                        .loginOtherLoginButtonList[1].textColor,
                              ),
                            ),
                  ],
                ),
              ),
              // Or Text
              Text(
                context.tr('orMailLoginMethod'),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // Email and Password
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                  horizontal: width * SharedConstants.paddingGenerall,
                ),
                child: Column(
                  children: [
                    for (int i = 0; i < 2; i++)
                      Padding(
                        padding: EdgeInsets.only(
                          top: i == 0
                              ? 0
                              : height * SharedConstants.paddingGenerall,
                        ),
                        child: TextFormWidget(
                          model: modelList[i],
                        ),
                      ),
                  ],
                ),
              ),

              const RememberandForgetPasswordWidget(),
              // Login Button
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                ),
                child: GeneralButtonWidget(
                  text: context.tr('loginButton'),
                  textColor: Colors.white,
                  backgroundColor: SharedConstants.orangeColor,
                  route: "/pattern",
                ),
              ),
              // Register
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: RichText(
                  text: TextSpan(
                    text: context.tr('dontHaveAccount'),
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: " ${context.tr('register')}",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: SharedConstants.orangeColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              // Privacy Policy
              Padding(
                padding: EdgeInsets.only(
                  top: height * SharedConstants.paddingGenerall,
                ),
                child: const LoginPageFaqGdprWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
