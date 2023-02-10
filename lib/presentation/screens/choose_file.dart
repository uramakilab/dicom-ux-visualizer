import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ChooseFile extends StatefulWidget {
  const ChooseFile({super.key});

  @override
  State<ChooseFile> createState() => _ChooseFileState();
}

class _ChooseFileState extends State<ChooseFile> {
  late List<FileSystemEntity> files = [];
  @override
  void initState() {
    super.initState();
    _getFiles();
  }

  void _getFiles() async {
    Directory dir = await getApplicationDocumentsDirectory();
    print(dir.toString());
    files = await Directory('${dir.path}/flutter_assets').list().toList();
    //files = await Directory('assets/dicom/').list().toList();
    print(files);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('your files')),
      ),
      body: ListView(
        children: [
          if (files.isNotEmpty) ...[
            for (int i = 0; i < files.length; i++) ...[
              Center(
                child: Center(child: Text(files[i].path.toString())),
              )
            ],
          ] else ...[
            Center(
              child: CircularProgressIndicator(),
            )
          ]
        ],
      ),
    );
  }
}
