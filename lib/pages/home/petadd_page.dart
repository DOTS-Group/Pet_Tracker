import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';
import 'package:pet_tracker/widgets/other/petadd/appbar_widget.dart';
import 'package:pet_tracker/widgets/textinputcontainer_widget.dart';

import '../../widgets/other/petadd/colorselect_widget.dart';
import '../../widgets/other/petadd/dateofbirth_widget.dart';
import '../../widgets/other/petadd/foodtypeselect_widget.dart';
import '../../widgets/other/petadd/selectedsex_widget.dart';
import '../../widgets/other/petadd/weightinput_widget.dart';
import '../../widgets/other/petcategories_widget.dart';

class PetaddPage extends StatelessWidget {
  const PetaddPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List<String> petCateoiesList = [
      context.tr("dog"),
      context.tr("cat"),
      context.tr("bird"),
      context.tr("fish"),
      context.tr("hamster"),
      context.tr("rabbit"),
      context.tr("turtle"),
    ];

    List<TextEditingController> controllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
                vertical: height * SharedConstants.paddingGenerall,
              ),
              child: const AppBarWidget(),
            ),
            // Pet Categories
            Padding(
              padding: EdgeInsets.only(
                left: width * SharedConstants.paddingGenerall,
                bottom: height * SharedConstants.paddingSmall,
              ),
              child: Text(
                "${context.tr("selectPetCategory")} :",
              ),
            ),
            PetCategoriesWidget(petCateoiesList: petCateoiesList),
            // Color Input
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
                vertical: height * SharedConstants.paddingSmall,
              ),
              child: ColorSelectWidget(controller: controllers[0]),
            ),
            // Selected sex
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: const SelectedSexWidget(),
            ),
            // Date of birth with date picker
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
                vertical: height * SharedConstants.paddingSmall,
              ),
              child: DateofBirthWidtget(controllers: controllers[1]),
            ),
            // Weight Input with unit
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: const WeightInputWidget(),
            ),
            // Food type
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingGenerall,
              ),
              child: const FoodTypeSelectWidget(),
            ),
            // Microchip Number
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mikroçip Numarası",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * SharedConstants.paddingSmall,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          height * SharedConstants.paddingGenerall,
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Mikroçip numarası giriniz",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Save Button
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingGenerall,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: const GeneralButtonWidget(
                text: "Kaydet",
                backgroundColor: Colors.amber,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

