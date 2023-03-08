import 'dart:convert';
import 'package:dicom_viewer/logic/dtos/dicom_dto.dart';
import 'package:dicom_viewer/presentation/screens/scroll_page.dart';
import 'package:http/http.dart';
import 'package:dicom_viewer/presentation/palette/colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'image_view_page.dart';
import 'dart:convert';

class ChooseFromStorage extends StatefulWidget {
  const ChooseFromStorage({super.key});

  @override
  State<ChooseFromStorage> createState() => _ChooseFromStorageState();
}

class _ChooseFromStorageState extends State<ChooseFromStorage> {
  final url = 'https://e515-200-211-62-61.ngrok.io';
  late FilePickerResult? choice;
  String? message;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    uploadFiles();
  }

  void uploadFiles() async {
    final result = await FilePicker.platform.pickFiles(
      withData: true,
      allowMultiple: true,
      withReadStream: true,
    );
    choice = result;
    _postData(url + '/upload', choice!.files);
  }

  Future _getData(int index, url) async {
    setState(() {
      isLoading = true;
    });
    final query = {'item': '$index'};
    Response response =
        await get(Uri.parse(url).replace(queryParameters: query));
    setState(() {
      isLoading = false;
    });
    return response.body;
  }

  Future _getImages(url) async {
    setState(() {
      isLoading = true;
    });
    Response response = await get(Uri.parse(url + '/getAllImages'));
    setState(() {
      isLoading = false;
    });
    return response.body;
  }

  Future _postData(url, List<PlatformFile> content) async {
    content.forEach((element) async {
      final request = MultipartRequest("POST", Uri.parse(url));
      final headers = {"Content-type": "multipart/form-data"};
      request.files.add(MultipartFile('file', element.readStream!, element.size,
          filename: element.name));
      request.headers.addAll(headers);
      final response = await request.send();
      Response res = await Response.fromStream(response);
      final resJson = jsonDecode(res.body);
      message = resJson["message"];
      print(message);
      setState(() {
        isLoading = false;
      });
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
                    onTap: (() async {
                      var data = await _getData(i, url);
                      var dicom =
                          DicomDto.fromJson(json.decode(data)).toDomain();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ImageViewPage(dicom: dicom)));
                    }),
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
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      side: BorderSide(width: 2, color: ColorPalette.secondary),
                    ),
                    onPressed: () async {
                      var data = await _getImages(url);
                      String decoded = (jsonDecode(data)['images']);
                      var treated = decoded.replaceAll("'", '"');
                      List<dynamic> jsonParsed = json.decode(treated);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ScrollPage(
                            imageData: jsonParsed,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'take to scroll viewer',
                      style: TextStyle(color: ColorPalette.text),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
