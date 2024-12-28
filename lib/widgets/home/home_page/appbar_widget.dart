import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';
import '../../other/petselected_widget.dart';

class HomePageAppBarWidget extends StatelessWidget {
  const HomePageAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * SharedConstants.paddingGenerall,
        vertical: height * SharedConstants.paddingSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Pet Selected Dropdown
          const PetSelectedDropdownButtonWidget(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/notifications");
            },
            child: const Icon(
              Icons.notifications_none_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
