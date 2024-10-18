import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final IconData leadingIcon, trailingIcon;
  final String title;
  final VoidCallback? leadingIconPressed, trailingIconPressed;
  const AppBarWidget({
    required this.leadingIcon,
    required this.trailingIcon,
    required this.title,
    this.leadingIconPressed,
    this.trailingIconPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(leadingIcon),
          onPressed: () {
            leadingIconPressed == null ? null : leadingIconPressed!();
          },
        ),
        Text(title),
        IconButton(
          icon: Icon(trailingIcon),
          onPressed: () {
            trailingIconPressed == null ? null : trailingIconPressed!();
          },
        ),
      ],
    );
  }
}
