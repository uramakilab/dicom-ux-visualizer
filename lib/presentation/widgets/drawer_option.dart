import 'package:dicom_viewer/presentation/routes/smart_router.dart';
import 'package:flutter/material.dart';

class DrawerOption extends StatefulWidget {
  const DrawerOption({super.key, required this.title, required this.icon, required this.route});
  final String title;
  final IconData icon;
  final String route;

  @override
  State<DrawerOption> createState() => _DrawerOptionState();
}

class _DrawerOptionState extends State<DrawerOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.title),
          leading: Icon(widget.icon),
          onTap: (){
            SmartRouter.of(context).pushNamedAndRemoveAll(widget.route);
          },
        ),
        Divider()
      ],
    );
  }
}