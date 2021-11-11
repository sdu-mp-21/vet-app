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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //final ImagePicker _picker = ImagePicker();
  File? image;

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
            onPressed: () {},
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
                      Text('Корова',
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
                      Text('9502394823',
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
                      Text('Самка',
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
                      Text('Казахская белоголовая',
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
                      Text('Бела-Коричневый',
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
                        child: Image(
                          image: NetworkImage('https://www.agroinvestor.ru/upload/iblock/8de/8de23dcf93a15ba49ae204f2498df956.jpg'),
                        )
                    ),
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
                      child: IconButton(
                        icon: Icon(Icons.add_outlined),
                        onPressed: () {},
                      ),
                    )
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
