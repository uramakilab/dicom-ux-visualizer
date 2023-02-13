import 'package:flutter/material.dart';
import 'package:scribble/scribble.dart';

import '../palette/colors.dart';
import '../widgets/navigation_drawer_widget.dart';

class Draw extends StatefulWidget {
  const Draw({super.key});

  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> {
  late ScribbleNotifier notifier;

  @override
  void initState() {
    notifier = ScribbleNotifier();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette.primary,
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: ColorPalette.primary,
          title: Text(
            'Drawing page',
            style: TextStyle(
              color: ColorPalette.text,
            ),
          ),
        ),
        body: Scribble(
          notifier: notifier,
          drawPen: true,
        ));
  }
}
