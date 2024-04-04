import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  bool previewImage = false;

  void _pickImage() async {
    _image = await _picker.pickImage(source: ImageSource.camera);
  }

  _preview() {
    if (_image != null) {
      setState(() => previewImage = !previewImage);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload an image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 18,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Upload a Image',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            SizedBox(height: 36),
            DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [9, 4.5],
              strokeWidth: 0.7,
              padding: EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: SizedBox(
                  height: height / 1.8,
                  width: width - 90,
                  child: !previewImage
                      ? Image.asset(
                          './assets/images/upload_image.png',
                          height: 90,
                        )
                      : Image.file(
                          File(_image!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      fixedSize: Size(120, 0),
                      elevation: 5.4,
                    ),
                    child: Text('Upload'),
                  ),
                  ElevatedButton(
                    onPressed: _preview,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !previewImage ? Colors.grey : Colors.red.shade200,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      fixedSize: Size(120, 0),
                      elevation: 5.4,
                    ),
                    child: !previewImage ? Text('View') : Text('Hide'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
