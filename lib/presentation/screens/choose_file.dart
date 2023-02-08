import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChooseFile extends StatefulWidget {
  const ChooseFile({super.key});

  @override
  State<ChooseFile> createState() => _ChooseFileState();
}

class _ChooseFileState extends State<ChooseFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('your files')),
      ),
      body: ListView(
        children: const [
          Center(child: Text('test')),
        ],
      ),
    );
  }
}
