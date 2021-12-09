import 'package:flutter/material.dart';
import 'dart:io';
import 'package:vet_project/view/owner_adding_animal.dart';

import 'package:image_picker/image_picker.dart';

import 'check_mate.dart';

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

  final selectedType;
  final selectedSuit;
  final selectedBreed;
  final gender;
  final animal_birthday;
  final typeId;
  const HomePage({Key? key, this.selectedType, this.selectedSuit, this.selectedBreed, this.gender, this.animal_birthday, this.typeId,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //final ImagePicker _picker = ImagePicker();
  AnimalAdding animal = AnimalAdding();
  File? image;
  File? image1;
  File? image2;

  void filePicker() async {
    final File? selectedImage = await ImagePicker.pickImage(source: ImageSource.camera);
    print(selectedImage!.path);
    setState(() {
      image = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,
                color: Colors.black),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimalAdding()));
            },
          ),
          title: const Text(
            "Завершение регистрации",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text('Тип животного',
                        style: TextStyle(color:Color.fromRGBO(93, 105, 120, 50),height: 0.5,fontSize: 12),
                      ),
                      Text(widget.selectedType,
                          style: TextStyle(fontSize:16, height:1.5, )
                      ),
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.only(top:30),
                  child: Column(
                    children: [
                      Text('ИНЖ',
                        style: TextStyle(color: Color.fromRGBO(93, 105, 120, 50), height: 0.5, fontSize:12),
                      ),
                      Text(widget.typeId,
                          style: TextStyle(fontSize: 16, height: 1.5)
                      ),
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.only(top:30),
                  child: Column(
                    children: [
                      Text('Пол',
                        style: TextStyle(color: Color.fromRGBO(93, 105, 120, 50), height: 0.5, fontSize:12),
                      ),
                      Text(widget.gender,
                          style: TextStyle(fontSize: 16, height: 1.5)
                      ),
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.only(top:30),
                  child: Column(
                    children: [
                      Text('Порода',
                        style: TextStyle(color: Color.fromRGBO(93, 105, 120, 50), height: 0.5, fontSize:12),
                      ),
                      Text(widget.selectedSuit,
                          style: TextStyle(fontSize: 16, height: 1.5)
                      ),
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.only(top:30),
                  child: Column(
                    children: [
                      Text('Дата рождения',
                        style: TextStyle(color: Color.fromRGBO(93, 105, 120, 50), height: 0.5, fontSize:12),
                      ),
                      Text(widget.animal_birthday,
                          style: TextStyle(fontSize: 16, height: 1.5)
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top:30),
                  child: Column(
                    children: [
                      Text('Масть',
                        style: TextStyle(color: Color.fromRGBO(93, 105, 120, 50), height: 0.5, fontSize:12),
                      ),
                      Text(widget.selectedBreed,
                          style: TextStyle(fontSize: 16, height: 1.5)
                      ),
                    ],
                  ),
                ),


              ],
            ),
            Padding(
                padding: EdgeInsetsDirectional.only(top: 30),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Stack(
                      children: [
                        Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
                            left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
                            right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                            bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
                          ),
                        ),
                        width:100,
                        height: 100,
                        child: image2 == null? showIconButton() : Image.file(File(image2!.path)),
                      ),
                        Positioned(
                          top: -10,
                          right:-10,
                          child: IconButton(onPressed: (){
                            setState(() {
                              if(image2 != null)
                                image2 = null;
                            });
                          }, icon: Icon(Icons.cancel_outlined)),),

                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
                              left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
                              right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                              bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
                            ),
                          ),
                          width:100,
                          height: 100,
                          child: image == null? showIconButton() : Image.file(File(image!.path)),
                        ),
                        Positioned(
                          top: -10,
                          right:-10,
                          child: IconButton(onPressed: (){
                            setState(() {
                              if(image != null)
                                image = null;
                            });
                          }, icon: Icon(Icons.cancel_outlined)),),
                    ]
                    ),
                    Stack(
                      children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
                            left: BorderSide(width: 1.0, color: Color(0xFFFFFFFF)),
                            right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                            bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
                          ),
                        ),
                        width:100,
                        height: 100,
                        child: image1 == null ? IconButton(
                          icon: Icon(Icons.add_outlined),
                          onPressed: () async {
                            final File? selectedImage = await ImagePicker.pickImage(source: ImageSource.camera);
                            setState(() {
                              image1 = selectedImage;
                            });
                          },
                        ) : Image.file(File(image1!.path)),
                      ),
                        Positioned(
                          top: -10,
                          right:-10,
                          child: IconButton(onPressed: (){
                            setState(() {
                              if(image1 != null)
                                image1 = null;
                            });
                          }, icon: Icon(Icons.cancel_outlined)),),
                      ],

                    ),
                  ],
                )
            ),
            Padding(
                padding: EdgeInsetsDirectional.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimalAdding()));
                    },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                        ),
                        child: Text("Заполнить заново",
                          style: TextStyle(color: Colors.black),)
                    ),
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                    },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(255, 122, 0, 1),
                      ),
                      child: Text("Завершить"),
                    ),
                  ],
                )
            ),
          ],
        )
    );
  }

  Widget showIconButton() {
    return IconButton(
      icon: Icon(Icons.add_outlined),
      onPressed: () {
        filePicker();
      },
    );
  }

}
