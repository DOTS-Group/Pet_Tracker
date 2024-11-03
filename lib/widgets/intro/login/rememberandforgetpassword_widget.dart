import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants_shared.dart';
import '../../../shared/provider_shared.dart';

class RememberandForgetPasswordWidget extends StatelessWidget {
  const RememberandForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return // Remember Me and Forgot Password
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Consumer(builder: (context, ref, child) {
              final bool rememberMe = ref.watch(rememberMeProvider);
              return Checkbox(
                value: rememberMe,
                onChanged: (value) {
                  ref
                      .read(rememberMeProvider.notifier)
                      .update((variable) => !rememberMe);
                },
                activeColor: SharedConstants.orangeColor,
              );
            }),
            Text(
              context.tr('rememberMe'),
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/renewpassword");
          },
          child: Text(
            context.tr('forgetPassword'),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
