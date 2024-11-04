import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants_shared.dart';
import '../../../shared/provider_shared.dart';

class TextFormWidget extends StatelessWidget {
  final IconData? leadingIcon, trailingIcon;
  final String hintText;
  final bool isPasswordForm;
  const TextFormWidget({
    required this.leadingIcon,
    required this.hintText,
    required this.isPasswordForm,
    this.trailingIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Icon(
          leadingIcon,
          color: SharedConstants.orangeColor,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: width * SharedConstants.paddingMedium,
              right: width * SharedConstants.paddingMedium,
            ),
            child: Consumer(builder: (context, ref, child) {
              final bool isPasswordVisible = ref.watch(isPasswordVisibile);
              return TextField(
                cursorColor: SharedConstants.orangeColor,
                obscureText: isPasswordForm == true ? isPasswordVisible : false,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black), // Odaklandığında siyah alt çizgi
                  ),
                ),
              );
            }),
          ),
        ),
        isPasswordForm == false
            ? SizedBox(
                width: Theme.of(context).iconTheme.size,
              )
            : Consumer(
                builder: (context, ref, child) {
                  final bool isPasswordVisible = ref.watch(isPasswordVisibile);
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
    );
  }
}
