import 'package:flutter/material.dart';

import 'drawer_option.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({super.key});

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: ListView(
          children: const [
            DrawerOption(
              title: 'home',
              icon: Icons.home,
              route: '/',
            ),
            DrawerOption(
              title: 'draw',
              icon: Icons.brush,
              route: '/draw',
            ),
            DrawerOption(
              title: 'files',
              icon: Icons.file_open,
              route: '/files',
            ),
          ],
        ),
      ),
    );
  }
}