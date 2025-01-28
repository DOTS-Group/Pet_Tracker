import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/constants_shared.dart';
import '../../shared/provider_shared.dart';

// Move fake data outside the class
final List<Map<String, String>> fakePets = [
  {
    "name": "Poyraz",
    "image": "https://picsum.photos/200/300",
  },
  {
    "name": "Luna (Example)",
    "image": "https://picsum.photos/200/301",
  },
  {
    "name": "Max (Example)",
    "image": "https://picsum.photos/200/302",
  },
];

class PetSelectedDropdownButtonWidget extends ConsumerStatefulWidget {
  const PetSelectedDropdownButtonWidget({super.key});

  @override
  ConsumerState<PetSelectedDropdownButtonWidget> createState() =>
      _PetSelectedDropdownButtonWidgetState();
}

class _PetSelectedDropdownButtonWidgetState
    extends ConsumerState<PetSelectedDropdownButtonWidget> {
  @override
  void initState() {
    super.initState();
    // Set the initial value in initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(selectedPetProvider).isEmpty) {
        ref.read(selectedPetProvider.notifier).state = fakePets[0]["name"]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Create dropdown items
    List<DropdownMenuItem<String>> petList = fakePets.map((pet) {
      return DropdownMenuItem(
        value: pet["name"],
        child: PetSelectedRowWidget(
          petName: pet["name"]!,
          petImageRoute: pet["image"]!,
        ),
      );
    }).toList();

    // Get the selected pet from Riverpod
    String selectedPet = ref.watch(selectedPetProvider);

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
          value: selectedPet.isEmpty ? fakePets[0]["name"] : selectedPet,
          items: petList,
          onChanged: (value) {
            if (value != null) {
              ref.read(selectedPetProvider.notifier).state = value;
            }
          },
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
