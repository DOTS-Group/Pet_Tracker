import 'package:flutter/material.dart';
import 'package:pet_tracker/pages/home/petadd_page.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/shared/list_shared.dart';

import 'calendar_page.dart';
import 'home_page.dart';
import 'map_page.dart';
import 'profile_page.dart';

class PatternPage extends StatefulWidget {
  const PatternPage({super.key});

  @override
  State<PatternPage> createState() => _PatternPageState();
}

class _PatternPageState extends State<PatternPage> {
  late int _selectedIndex;
  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: _selectedIndex == 0
            ? HomePage()
            : _selectedIndex == 1
                ? MapPage()
                : _selectedIndex == 2
                    ? CalendarPage()
                    : _selectedIndex == 3
                        ? ProfilePage()
                        : PetaddPage(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = 4;
          });
        },
        child: Card(
          elevation: 2,
          color: SharedConstants.orangeColor,
          // Shape circle
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              height * 0.1,
            ),
          ),
          shadowColor: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * SharedConstants.paddingGenerall,
              horizontal: height * SharedConstants.paddingGenerall,
            ),
            child: Icon(
              Icons.pets_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
              offset: Offset(-1, -1),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: Row(
          children: [
            for (int i = 0; i < 5; i++)
              i == 2
                  ? Expanded(
                      child: SizedBox(),
                    )
                  : Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = i;
                          });
                        },
                        child: Icon(
                          SharedList.patternPageIconList[i],
                          color: _selectedIndex == 5
                              ? Colors.grey
                              : _selectedIndex == i
                                  ? Colors.yellow
                                  : Colors.grey,
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}
