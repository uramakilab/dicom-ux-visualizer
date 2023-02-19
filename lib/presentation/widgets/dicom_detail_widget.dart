import 'package:dicom_viewer/presentation/palette/colors.dart';
import 'package:dicom_viewer/presentation/routes/smart_router.dart';
import 'package:flutter/material.dart';

class DicomDetailWidget extends StatefulWidget {
  DicomDetailWidget({
    super.key,
    required this.title,
    required this.label,
    required this.icon,
  });
  final String title;
  final String label;
  final IconData icon;
  
  @override
  State<DicomDetailWidget> createState() => _DicomDetailWidgetState();
}

class _DicomDetailWidgetState extends State<DicomDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: ColorPalette.primary,
          iconColor: ColorPalette.special,
          textColor: ColorPalette.text,
          dense: true,
          subtitle: Text(widget.title),
          title: Text('${widget.label}:'),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon,),
            ],
          ),
        ),
        Divider(
          color: ColorPalette.secondary,
        )
      ],
    );
  }
}
