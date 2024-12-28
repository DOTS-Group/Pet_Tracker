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
    List<DropdownMenuItem<String>> petList = [
      const DropdownMenuItem(
        value: "Poyraz",
        child: PetSelectedRowWidget(
          petName: "Poyraz",
          petImageRoute: "https://picsum.photos/200/300",
        ),
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingLarge,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * SharedConstants.paddingSmall / 8,
          horizontal: width * SharedConstants.paddingSmall,
        ),
        child: DropdownButton(
          padding: EdgeInsets.zero,
          underline: const SizedBox(),
          value: "Poyraz",
          items: petList,
          onChanged: (value) {},
        ),
      ),
    );
  }
}

class PetSelectedRowWidget extends StatelessWidget {
  final String petName, petImageRoute;
  const PetSelectedRowWidget({
    required this.petName,
    required this.petImageRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height * 0.04,
          width: height * 0.04,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              height * SharedConstants.paddingLarge,
            ),
            child: Image.network(
              petImageRoute,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: width * SharedConstants.paddingGenerall,
          ),
          child: Text(
            petName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
