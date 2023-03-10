import 'dart:convert';

import 'package:dicom_viewer/presentation/palette/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key, required this.imageData});
  final List<Uint8List> imageData;

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  bool isLoading = true;
  int display = 0;
  double sliderValue = 1;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'dicom scroller',
          style: TextStyle(color: ColorPalette.text),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: ColorPalette.special,
        ),
        backgroundColor: ColorPalette.primary,
      ),
      backgroundColor: ColorPalette.primary,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              height: double.infinity,
              child: Center(
                child: Image.memory(widget.imageData[display]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Slider(
              min: 1,
              max: widget.imageData.length.toDouble() > 0 ? widget.imageData.length.toDouble() : 2,
              value: sliderValue,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                  display = newValue.toInt() - 1;
                });
              },
              divisions: widget.imageData.length -1,
            ),
          )
        ],
      ),
    );
  }
}
