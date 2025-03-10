import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/widgets/other/petselected_widget.dart';
import '../../shared/constants_shared.dart';
import '../../widgets/generalbutton_widget.dart';
import '../../widgets/home/activity/activityselected_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../controllers/home/activityaddpage_controller.dart';

class ActivityAddPage extends ConsumerWidget {
  const ActivityAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    try {
      ActivityaddpageController().checkAuth(ref);
      String selectedPet = "Poyraz";
      return Column(
        children: [
          const PetSelectedDropdownButtonWidget(),
          ActivitySelectedWidget(selectedPet: selectedPet)
        ],
      );
    } catch (e) {
      return _buildAuthRequiredView(context);
    }
  }

  Widget _buildAuthRequiredView(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingMedium,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.tr('loginRequiredMessage'),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * SharedConstants.paddingGenerall,
                ),
                child: GeneralButtonWidget(
                  backgroundColor: SharedConstants.orangeColor,
                  textColor: SharedConstants.secondaryColorLight,
                  text: context.tr('loginButton'),
                  voidCallback: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
