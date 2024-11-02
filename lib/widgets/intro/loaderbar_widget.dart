import 'package:flutter/material.dart';

class LoaderBarWidget extends StatelessWidget {
  const LoaderBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
        return Container(
          height: 4,
          width: width * 0.8,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: width * 0.8 * value,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        );
      },
    );
  }
}
