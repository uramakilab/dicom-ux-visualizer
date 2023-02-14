import 'dart:typed_data';
import 'package:dicom_viewer/presentation/palette/colors.dart';
import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';

class ChooseFromStorage extends StatefulWidget {
  const ChooseFromStorage({super.key});

  @override
  State<ChooseFromStorage> createState() => _ChooseFromStorageState();
}

class _ChooseFromStorageState extends State<ChooseFromStorage> {
  late FilePickerResult? choice;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getFiles();
  }


  
  void _getFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    choice = result;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary,
      appBar: AppBar(
        backgroundColor: ColorPalette.primary,
        title: Text(
          'your files',
          style: TextStyle(
            color: ColorPalette.text,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: ColorPalette.special,
              ),
            )
          : ListView(
              children: [
                for (int i = 0; i < choice!.files.length; i++) ...[
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (() => _parseDicom(choice!.files[i].size)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorPalette.secondary,
                              ),
                              borderRadius: BorderRadius.circular(18)),
                          child: ListTile(
                            title: Text(
                              choice!.files[i].name,
                              maxLines: 1,
                              style: TextStyle(
                                color: ColorPalette.text,
                              ),
                            ),
                            subtitle: Text(
                              choice!.files[i].path.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                color: ColorPalette.special,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
    );
  }

  void _parseDicom(int bytes){
    //TODO: implement parsing function
    print(bytes);
  }
}
