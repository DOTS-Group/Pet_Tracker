import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import '../../../models/splash intro login/form_model.dart';
import '../../../shared/constants_shared.dart';
import '../../../shared/provider_shared.dart';

class TextFormWidget extends StatelessWidget {
  final LoginFormModel model;
  const TextFormWidget({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: SharedConstants.orangeColor,
          width: 1.5,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            Icon(
              model.leadingIcon,
              color: SharedConstants.orangeColor,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * SharedConstants.paddingMedium,
                ),
                child: Consumer(builder: (context, ref, child) {
                  final bool isPasswordVisible = ref.watch(isPasswordVisibile);
                  return TextFormField(
                    controller: model.controller,
                    cursorColor: SharedConstants.orangeColor,
                    obscureText:
                        model.isPasswordForm ? isPasswordVisible : false,
                    validator: model.validator,
                    decoration: InputDecoration(
                      hintText: model.hintText,
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      errorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    inputFormatters: [
                      if (model.isPasswordForm)
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                  );
                }),
              ),
            ),
            model.isPasswordForm == false
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
                              .update((variable) => !isPasswordVisible);
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
    );
  }
}
