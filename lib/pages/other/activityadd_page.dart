import 'package:flutter/material.dart';
import 'package:pet_tracker/widgets/other/petselected_widget.dart';
import '../../widgets/home/activity/activityselected_widget.dart';

class ActicityAddPage extends StatelessWidget {
  const ActicityAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedPet = "Poyraz";
    return Column(
      children: [
        const PetSelectedDropdownButtonWidget(),
        ActivitySelectedWidget(selectedPet: selectedPet)
      ],
    );
  }
}
