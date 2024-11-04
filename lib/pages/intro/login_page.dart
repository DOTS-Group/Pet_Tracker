import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/shared/list_shared.dart';

import '../../shared/provider_shared.dart';
import '../../widgets/generalbutton_widget.dart';
import '../../widgets/intro/login/rememberandforgetpassword_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> titleList = [
      context.tr('welcomeMessage1'),
      context.tr('welcomeMessage2')
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
              Column(
                children: [
                  for (int i = 0; i < 2; i++)
                    Padding(
                      padding: EdgeInsets.only(
                          top: i == 0
                              ? 0
                              : height * SharedConstants.paddingGenerall),
                      child: Text(
                        titleList[i],
                        style: i == 0
                            ? Theme.of(context).textTheme.displayLarge
                            : Theme.of(context).textTheme.bodyLarge,
                      ),
                    )
                ],
              ),
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
                              child: Container(
                                decoration: BoxDecoration(
                                  color: i == 0
                                      ? SharedList.loginOtherLoginButtonList[0]
                                          .backgroundColor
                                      : SharedList.loginOtherLoginButtonList[1]
                                          .backgroundColor,
                                  borderRadius: BorderRadius.circular(
                                    height * SharedConstants.paddingGenerall,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical:
                                        height * SharedConstants.paddingSmall,
                                    horizontal:
                                        width * SharedConstants.paddingMedium,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        i == 0
                                            ? SharedList
                                                .loginOtherLoginButtonList[0]
                                                .icon
                                            : SharedList
                                                .loginOtherLoginButtonList[1]
                                                .icon,
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
                                              SharedConstants.paddingMedium,
                                        ),
                                        child: Text(
                                          i == 0
                                              ? SharedList
                                                  .loginOtherLoginButtonList[0]
                                                  .text
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
                        child: Row(
                          children: [
                            Icon(
                              i == 0 ? Icons.mail : Icons.lock,
                              color: SharedConstants.orangeColor,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: width * SharedConstants.paddingMedium,
                                  right: width * SharedConstants.paddingMedium,
                                ),
                                child: Consumer(builder: (context, ref, child) {
                                  final bool isPasswordVisible =
                                      ref.watch(isPasswordVisibile);
                                  return TextField(
                                    cursorColor: SharedConstants.orangeColor,
                                    obscureText:
                                        i == 0 ? false : isPasswordVisible,
                                    decoration: InputDecoration(
                                      hintText: i == 0
                                          ? context.tr('emailExample')
                                          : context.tr('passwordExample'),
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors
                                                .black), // Odaklandığında siyah alt çizgi
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            i == 0
                                ? SizedBox(
                                    width: Theme.of(context).iconTheme.size,
                                  )
                                : Consumer(
                                    builder: (context, ref, child) {
                                      final bool isPasswordVisible =
                                          ref.watch(isPasswordVisibile);
                                      return GestureDetector(
                                        onTap: () {
                                          ref
                                              .read(isPasswordVisibile.notifier)
                                              .update((variable) =>
                                                  !isPasswordVisible);
                                        },
                                        child: Icon(
                                          isPasswordVisible
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: SharedConstants.orangeColor,
                                        ),
                                      );
                                    },
                                  ),
                          ],
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
              RichText(
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
              // Privacy Policy
              Padding(
                padding: EdgeInsets.only(
                  top: height * SharedConstants.paddingGenerall,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 0; i < 2; i++)
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                insetPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      width * SharedConstants.paddingGenerall,
                                ),
                                backgroundColor: Colors.white,
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double dialogHeight =
                                        MediaQuery.of(context).size.height *
                                            0.6;

                                    return ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxHeight: constraints.maxHeight,
                                        minHeight: dialogHeight,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width *
                                              SharedConstants.paddingGenerall,
                                          vertical: height *
                                              SharedConstants.paddingGenerall,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Kapatma butonu sağ üst köşede
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                // child: Text(
                                                //   i == 0
                                                //       ? context.tr(
                                                //           "faqContent") // SSS içeriği
                                                //       : context.tr(
                                                //           "gdprContent"), // GDPR içeriği
                                                //   style: Theme.of(context)
                                                //       .textTheme
                                                //       .bodyMedium,
                                                // ),
                                                child: Consumer(
                                                  builder:
                                                      (context, ref, child) {
                                                    final String language =
                                                        ref.watch(
                                                            languageProvider);
                                                    String filePath = i == 0
                                                        ? "assets/agreements/$language/faq.txt"
                                                        : "assets/agreements/$language/gdpr.txt";

                                                    // FutureBuilder to handle the async loading of file content
                                                    return FutureBuilder(
                                                      future: rootBundle
                                                          .loadString(filePath),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.hasData) {
                                                          return Text(
                                                            snapshot.data
                                                                .toString(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black),
                                                          );
                                                        } else {
                                                          return const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          );
                                                        }
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          i == 0 ? context.tr("faq") : context.tr("gdpr"),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
