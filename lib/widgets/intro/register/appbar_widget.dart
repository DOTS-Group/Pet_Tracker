import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterAppBarWidget extends StatelessWidget {
  const RegisterAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        Text(
          context.tr('registerAppBar'),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          width: Theme.of(context).iconTheme.size,
        ),
      ],
    );
  }
}