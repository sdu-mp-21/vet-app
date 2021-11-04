// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class camera_page extends StatelessWidget {
  const camera_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final ImagePicker _picker = ImagePicker();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child:
        SizedBox(
          child: image == null ? Text("No Image Selected") : Image.file(File(image!.path)), width: 400, height: 500,
        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          filePicker();
        } ,
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  void filePicker() async {
    final File? selectedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    print(selectedImage!.path);
    setState(() {
      image = selectedImage;
    });
  }
}




