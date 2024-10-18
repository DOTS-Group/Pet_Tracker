// Main Libs
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Other Libs
import '../controllers/home/patternpage_controller.dart';
import '../shared/constants_shared.dart';
import '../shared/list_shared.dart';
import '../shared/provider_shared.dart';

class BottomNavbarWidget extends StatelessWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    PatternpageController patternpageController = PatternpageController();
    return Consumer(
      builder: (context, ref, child) {
        final selectedIndex = ref.watch(patternPageIndexProvider);
        return Container(
          height: height * 0.075,
          width: width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                height * SharedConstants.paddingGenerall,
              ),
              topRight: Radius.circular(
                height * SharedConstants.paddingGenerall,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondaryContainer,
                blurRadius: 1,
                // spreadRadius: 0.1,
                offset: const Offset(-1, -1),
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: Row(
            children: [
              for (int i = 0; i < 5; i++)
                i == 2
                    ? const Expanded(
                        child: SizedBox(),
                      )
                    : Expanded(
                        child: GestureDetector(
                          onTap: () {
                            patternpageController.indexController(ref, i);
                          },
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Icon(
                              SharedList.patternPageIconList[i],
                              color: selectedIndex == i
                                  ? SharedConstants.orangeColor
                                  : SharedConstants.greyColor,
                            ),
                          ),
                        ),
                      ),
            ],
          ),
        );
      },
    );
  }
}
