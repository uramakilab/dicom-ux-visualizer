import 'dart:convert';

import 'package:dicom_viewer/logic/dtos/dicom.dart';
import 'package:dicom_viewer/presentation/widgets/dicom_detail_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../palette/colors.dart';

class ImageViewPage extends StatefulWidget {
  const ImageViewPage({super.key, required this.dicom});
  final Dicom? dicom;

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary,
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        title: Text(
          'image details',
          style: TextStyle(
            color: ColorPalette.text,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: Placeholder(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: DicomDetailWidget(
              title: widget.dicom!.patientName,
              icon: Icons.person_outlined,
              label: 'patient name',
            ),
          ),
          DicomDetailWidget(
            title: widget.dicom!.transferSyntaxUid,
            icon: Icons.account_tree_outlined,
            label: 'transfer syntax uid',
          ),
          DicomDetailWidget(
            title: widget.dicom!.imageType,
            icon: Icons.image_outlined,
            label: 'image type',
          ),
          DicomDetailWidget(
            title: widget.dicom!.patientId,
            icon: Icons.assignment_ind_outlined,
            label: 'patient id',
          ),
          DicomDetailWidget(
            title: widget.dicom!.fileName,
            icon: Icons.insert_drive_file_outlined,
            label: 'file name',
          ),
          DicomDetailWidget(
            title: widget.dicom!.transferSyntaxUidName,
            icon: Icons.align_horizontal_left_outlined,
            label: 'syntax uid name',
          ),
          DicomDetailWidget(
              title: widget.dicom!.instanceCreationDate,
              label: 'instance creation date',
              icon: Icons.calendar_month_outlined),
          DicomDetailWidget(
              title: widget.dicom!.instanceCreationTime,
              label: 'instance creation time',
              icon: Icons.access_time),
          DicomDetailWidget(
              title: widget.dicom!.modality,
              label: 'modality',
              icon: Icons.add_to_photos_outlined),
        ],
      ), /*Center(
        child: Image.memory(base64Decode(widget.bytes!)),
      ),*/
    );
  }
}
