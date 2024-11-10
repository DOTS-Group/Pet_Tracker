import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';
import 'package:pet_tracker/widgets/other/petadd/appbar_widget.dart';

import '../../widgets/other/petadd/colorselect_widget.dart';
import '../../widgets/other/petadd/dateofbirth_widget.dart';
import '../../widgets/other/petadd/foodtypeselect_widget.dart';
import '../../widgets/other/petadd/microchipinpu_widget.dart';
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
    ];
    List<Widget> listWidget = [
      // Pet Type Select
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: width * SharedConstants.paddingGenerall),
            child: Text(
              "${context.tr("selectPetCategory")} :",
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: height * SharedConstants.paddingSmall),
            child: PetCategoriesWidget(petCateoiesList: petCateoiesList),
          ),
        ],
      ),
      // Color Input
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * SharedConstants.paddingGenerall,
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
        ),
        child: DateofBirthWidtget(controller: controllers[1]),
      ),
      // Weight Input with unit
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: WeightInputWidget(controller: controllers[2]),
      ),
      // Food type
      const FoodTypeSelectWidget(),
      // Microchip Number
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: MicroChipInputWidget(controller: controllers[3]),
      ),
      // Safe Area Padding
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.08,
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(
                height: height * 0.95,
                width: width,
                child: ListView.builder(
                  itemCount: listWidget.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: height * SharedConstants.paddingSmall,
                      ),
                      child: listWidget[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * SharedConstants.paddingGenerall,
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: GeneralButtonWidget(
          text: context.tr("save"),
          backgroundColor: SharedConstants.orangeColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
