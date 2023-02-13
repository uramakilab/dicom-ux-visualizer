import 'package:dicom_viewer/presentation/palette/colors.dart';
import 'package:dicom_viewer/presentation/routes/smart_router.dart';
import 'package:flutter/material.dart';

class DrawerOption extends StatefulWidget {
  DrawerOption({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
    this.canBack = false,
  });
  final String title;
  final IconData icon;
  final String route;
  bool canBack;

  @override
  State<DrawerOption> createState() => _DrawerOptionState();
}

class _DrawerOptionState extends State<DrawerOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: ColorPalette.primary,
          iconColor: ColorPalette.special,
          textColor: ColorPalette.text,
          
          title: Text(widget.title),
          leading: Icon(widget.icon),
          onTap: () {
            if (widget.canBack) {
              SmartRouter.of(context).pushNamed(widget.route);
            } else {
              SmartRouter.of(context).pushNamedAndRemoveAll(widget.route);
            }
          },
        ),
        Divider(
          color: ColorPalette.secondary,
        )
      ],
    );
  }
}
