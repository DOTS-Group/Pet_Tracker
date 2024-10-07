import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class PatternPage extends StatelessWidget {
  const PatternPage({super.key});

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return i==0?SideMenu(
    // key: _sideMenuKey,
    menu: Text(),
    type: SideMenuType.slideNRotate, // check above images
    child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                final _state = _sideMenuKey.currentState;
                if (_state.isOpened)
                  _state.closeSideMenu(); // close side menu
                else
                  _state.openSideMenu();// open side menu
              },
            ),
        
    ),
):Scaffold(
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
