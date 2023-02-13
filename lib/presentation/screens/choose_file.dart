import 'dart:io';
import 'package:dicom_viewer/presentation/palette/colors.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ChooseFile extends StatefulWidget {
  const ChooseFile({super.key});

  @override
  State<ChooseFile> createState() => _ChooseFileState();
}

class _ChooseFileState extends State<ChooseFile> {
  late List<FileSystemEntity> files = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _createFiles();
    _getFiles();
  }

  void _createFiles() async {
    Directory dir = await getApplicationDocumentsDirectory();
    for (int i = 0; i < 2; i++) {
      File('${dir.path}/myData/data${[i]}.txt');
    }
  }

  void _getFiles() async {
    Directory dir = await getApplicationDocumentsDirectory();

    File('${dir.path}/data.txt');
    print(dir.toString());
    files = await Directory('${dir.path}').list().toList();
    print(files);
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
                for (int i = 0; i < files.length; i++) ...[
                  SizedBox(
                    height: 10,
                  ),
                  Center(
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
                            files[i].path,
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorPalette.text,
                            ),
                          ),
                          subtitle: Text(
                            files[i].absolute.path,
                            maxLines: 1,
                            style: TextStyle(
                              color: ColorPalette.special,
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
}
