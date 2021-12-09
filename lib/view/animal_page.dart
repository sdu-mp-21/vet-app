import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_project/model/entity/animal_card.dart';
import '../model/entity/animal_type.dart';
import 'package:http/http.dart' as http;

class AnimalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimalPage();
}

class _AnimalPage extends State<AnimalPage> {
  TextStyle grayText =
      TextStyle(fontSize: 14, color: Color.fromRGBO(105, 125, 149, 1));
  TextStyle blackText = TextStyle(fontSize: 14, color: Colors.black);
  String token = "";
  List<OneAnimalCard> animals = [];

  Future<String> getUserData(String email, String password) async {
    Map data = {'email': email, 'password': password};
    var response = await http.post('https://admin.vetqyzmet.kz/api/v1/auth',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(data));
    var jsonData = null;
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      token = jsonData['token'];
      print('200');
      print(token);
    } else {
      print('not 200');
    }
    return token;
  }

  Future<List<OneAnimalCard>> getRegions(String tok) async {
    tok = await getUserData('email', 'password');
    var response = await http.get('https://admin.vetqyzmet.kz/api/v5/getInfo',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tok'
        });
    if (response.statusCode == 200) {
      print('token send');
    }
    final data = await json.decode(response.body) as List<dynamic>;
    setState(() {
      animals = data.map((e) => OneAnimalCard.fromJson(e)).toList();
    });
    return data.map((e) => OneAnimalCard.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Карты", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey[350]!, width: 2)),
      ),
      body: buildGridView(),
    );
  }

  Widget buildGridView() {
    return GridView.builder(itemCount: 10, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, mainAxisSpacing: 20), itemBuilder:
    (context, index) => buildCard()
    );
  }

  Widget buildCard() => Card(
      shadowColor: Colors.red,
      //elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Ink.image(
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/0/0c/Cow_female_black_white.jpg'),
              child: InkWell(
                onTap: () {},
              ),
              height: 240,
              fit: BoxFit.cover,
            )
          ],
        ),
        Row(
          children: [
            Container(
              child: Text(
                'ING: ',
                style: grayText,
              ),
              margin: EdgeInsets.only(left: 10, top: 10),
            ),
            Container(
              child: Text(
                '1121233',
                style: blackText,
              ),
              margin: EdgeInsets.only(left: 10, top: 10),
            )
          ],
        ),
        Row(
          children: [
            Container(
              child: Text(
                'Gender: ',
                style: grayText,
              ),
              margin: EdgeInsets.only(left: 10, top: 10),
            ),
            Container(
              child: Text(
                'Female',
                style: blackText,
              ),
              margin: EdgeInsets.only(left: 10, top: 10),
            )
          ],
        ),
        Row(
          children: [
            Container(
              child: Text(
                'Date: ',
                style: grayText,
              ),
              margin: EdgeInsets.only(left: 10, top: 10),
            ),
            Container(
              child: Text(
                '11.01.2020',
                style: blackText,
              ),
              margin: EdgeInsets.only(left: 10, top: 10),
            )
          ],
        ),
        Row(
          children: [
            Container(
              child: Text(
                'NJ: ',
                style: grayText,
              ),
              margin: EdgeInsets.only(left: 10, top: 10),
            ),
            Container(
              child: Text(
                'Milk',
                style: blackText,
              ),
              margin: EdgeInsets.only(left: 10, top: 10),
            )
          ],
        ),
      ]));
}
