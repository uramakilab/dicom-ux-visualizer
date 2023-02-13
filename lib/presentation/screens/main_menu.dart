import 'package:dicom_viewer/presentation/palette/colors.dart';
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
      backgroundColor: ColorPalette.primary,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        title: Text('Main Page',style: TextStyle(color: ColorPalette.text),),
      ),
      body: Center(
        child: Text('dicom viewer',style: TextStyle(color: ColorPalette.text)),
      ),
    );
  }
}

