import 'package:flutter/material.dart';

import 'constants_shared.dart';

class GeneralAddButton extends StatelessWidget {
  final String route;
  const GeneralAddButton({
    required this.route,
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: SharedConstants.whiteColor,
          borderRadius: BorderRadius.circular(
            height * SharedConstants.paddingGenerall,
          ),
          border: Border.all(
            color: SharedConstants.orangeColor,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * SharedConstants.paddingGenerall,
          ),
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}