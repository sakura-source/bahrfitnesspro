import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProgressPhotosScreen extends StatefulWidget {
  @override
  _ProgressPhotosScreenState createState() => _ProgressPhotosScreenState();
}

class _ProgressPhotosScreenState extends State<ProgressPhotosScreen> {
  List<XFile> _photos = [];

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _photos.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Photos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: _photos.length,
              itemBuilder: (context, index) {
                return Image.file(File(_photos[index].path));
              },
            ),
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: Text('Upload New Photo'),
          ),
        ],
      ),
    );
  }
}
