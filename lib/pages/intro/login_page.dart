import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/models/splash%20intro%20login/form_model.dart';

import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/shared/list_shared.dart';

import '../../widgets/generalbutton_widget.dart';
import '../../widgets/intro/login/faqgdprbuttons_widget.dart';
import '../../widgets/intro/login/rememberandforgetpassword_widget.dart';
import '../../widgets/intro/login/textform_widget.dart';
import '../../widgets/intro/login/welcomemessage_widget.dart';
import '../../controllers/intro/loginpage_controller.dart';
import '../../shared/provider_shared.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final LoginPageController _controller = LoginPageController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<bool> _onWillPop(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(context.tr('exitApp')),
            content: Text(context.tr('exitAppConfirm')),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(context.tr('cancel')),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(context.tr('exit')),
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Column(
                children: [
                  // Üst kısım - scrollable alan
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Header
                        Column(
                          children: [
                            // Header Image
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.05),
                              child: Image.asset(
                                SharedConstants.logoImageRoute,
                                height: height * 0.15,
                              ),
                            ),
                            // Welcome Messages
                            const LoginPageWelcomeMessageWidget(),
                          ],
                        ),
                        // Or Login Method
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * SharedConstants.paddingGenerall,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (var button
                                  in SharedList.socialLoginButtonList)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                  ),
                                  child: _buildSocialButton(
                                    context: context,
                                    icon: button['icon'],
                                    color: button['color'],
                                    isActive: button['isActive'],
                                    onTap: button['isActive']
                                        ? () {
                                            ref
                                                .read(anonymousUserProvider
                                                    .notifier)
                                                .state = true;
                                            Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              '/pattern',
                                              (route) => false,
                                            );
                                          }
                                        : null,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Text(
                          context.tr('orQuickLogin'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                color: SharedConstants.orangeColor.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                        ),
                        // Email and Password
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: height * SharedConstants.paddingSmall,
                          ),
                          child: Column(
                            children: [
                              for (var model in SharedList.formModelList)
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: model == SharedList.formModelList.first
                                        ? 0
                                        : height * SharedConstants.paddingSmall,
                                  ),
                                  child: TextFormWidget(
                                    model: LoginFormModel(
                                      leadingIcon: model['leadingIcon'],
                                      hintText: context.tr(model['hintText']),
                                      isPasswordForm: model['isPasswordForm'],
                                      controller: model['isPasswordForm']
                                          ? _passwordController
                                          : _emailController,
                                      validator: (value) => _controller
                                              .validators[model['validator']]!(
                                          value),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // Remember and Forget Password
                        const RememberandForgetPasswordWidget(),
                      ],
                    ),
                  ),
                  // Alt kısım - sabit alan
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Login Button
                      Padding(
                        padding: EdgeInsets.only(
                          top: height * SharedConstants.paddingSmall,
                        ),
                        child: GeneralButtonWidget(
                          text: context.tr('loginButton'),
                          textColor: Colors.white,
                          backgroundColor: SharedConstants.orangeColor,
                          voidCallback: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _controller.handleLogin(
                                context,
                                _emailController.text,
                                _passwordController.text,
                              );
                            }
                          },
                        ),
                      ),
                      // Register
                      Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: GestureDetector(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: SharedConstants.orangeColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Privacy Policy
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * SharedConstants.paddingSmall,
                        ),
                        child: const LoginPageFaqGdprWidget(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required BuildContext context,
    required IconData icon,
    required Color color,
    bool isActive = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isActive ? color : color.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
