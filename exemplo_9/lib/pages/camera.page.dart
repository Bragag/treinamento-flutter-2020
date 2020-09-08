import 'dart:io';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:exemplo_9/file.utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File _image;
  final picker = ImagePicker();

  _takePic() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  _share() {
    FileUtils.getBytesFromFile(_image).then(
      (bytes) {
        Share.file(
          'title',
          p.basename(_image.path),
          bytes.buffer.asUint8List(),
          'image/png'
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _image == null ? _takePic : _share,
        child: Icon(Icons.camera_alt),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: _image == null
            ? CupertinoActivityIndicator()
            : Image.file(
                _image,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
