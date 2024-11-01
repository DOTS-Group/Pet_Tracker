import 'package:flutter/material.dart';

import '../../shared/constants_shared.dart';

class PetSelectedDropdownButtonWidget extends StatelessWidget {
  const PetSelectedDropdownButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      // width: width * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingLarge,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * SharedConstants.paddingSmall / 2,
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: DropdownButton(
          padding: EdgeInsets.zero,
          underline: const SizedBox(),
          value: "Poyraz",
          items: [
            DropdownMenuItem(
              value: "Poyraz",
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: height * SharedConstants.paddingGenerall,
                    backgroundColor: Colors.amber,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * SharedConstants.paddingGenerall,
                    ),
                    child: Text(
                      "Poyraz",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
