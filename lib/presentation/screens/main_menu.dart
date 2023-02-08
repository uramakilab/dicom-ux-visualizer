import 'package:flutter/material.dart';

import '../widgets/navigation_drawer_widget.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Text('dicom viewer'),
      ),
    );
  }
}

