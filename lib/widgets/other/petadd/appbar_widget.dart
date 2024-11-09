import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
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
            Icons.arrow_back_ios,
          ),
        ),
        Text(
          context.tr("petaddPage"),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          width: Theme.of(context).iconTheme.size,
        )
      ],
    );
  }
}
