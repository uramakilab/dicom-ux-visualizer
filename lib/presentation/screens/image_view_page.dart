import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatefulWidget {
  const ImageViewPage({super.key, required this.bytes});
  final Uint8List? bytes;

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.memory(Uint8List.fromList(widget.bytes!)),
      ),
    );
  }
}
