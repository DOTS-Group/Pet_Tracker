// Main Libs
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Other Libs
import '../../controllers/home/patternpage_controller.dart';
import '../../shared/provider_shared.dart';
import '../../widgets/bottomnavbar_widget.dart';
import '../../widgets/fab_widget.dart';

class PatternPage extends ConsumerWidget {
  const PatternPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PatternpageController patternpageController = PatternpageController();
    int selectedIndex = ref.watch(patternPageIndexProvider);
    return Scaffold(
      body: SafeArea(
        child: patternpageController.getPageController(selectedIndex),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FabWidget(ref: ref),
      bottomNavigationBar: const BottomNavbarWidget(),
    );
  }
}
