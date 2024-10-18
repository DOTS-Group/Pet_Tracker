import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/home/patternpage_controller.dart';
import '../shared/constants_shared.dart';

class FabWidget extends StatelessWidget {
  final WidgetRef ref;
  const FabWidget({
    required this.ref,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    PatternpageController patternpageController = PatternpageController();
    return GestureDetector(
      onTap: () {
        patternpageController.indexController(ref, 2);
      },
      child: Card(
        elevation: 2,
        color: SharedConstants.orangeColor,
        // Shape circle
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            height * 0.1,
          ),
        ),
        shadowColor: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * SharedConstants.paddingGenerall,
            horizontal: height * SharedConstants.paddingGenerall,
          ),
          child: const Icon(
            Icons.pets_rounded,
            color: SharedConstants.whiteColor,
          ),
        ),
      ),
    );
  }
}
