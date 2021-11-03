import 'dart:convert';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:badges/badges.dart';
import 'package:vet_project/choose_owner.dart';

import 'app_constants.dart';

class AnimalRegistration extends StatefulWidget {
  const AnimalRegistration({Key? key}) : super (key: key);
  @override
  State<StatefulWidget> createState() => 
  _AnimalRegistration();
}

class _AnimalRegistration extends State<AnimalRegistration> {
  List _items = [];



  Future<void> readJson() async {
    final String responce = await rootBundle.loadString('lib/entities/some_entities.json');
    final data = await json.decode(responce);
    setState(() {
      _items = data['regions'];
    });
  }

  bool selectedPrev = true;
  bool selectedNext = true;
  String? pageTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.GREY_COLOR),
        elevation: 0,
        leading: IconButton(
              icon: Icon( selectedPrev ? Icons.arrow_back : Icons.title),
              onPressed: () {
                Navigator.pop(context);
              },
          ),
        title:const Text("Регистрация животных", style: TextStyle(color: AppColors.GREY_COLOR)),
        centerTitle: true,
        shape: Border(bottom: BorderSide(
          color: Colors.grey[350]!, 
          width: 2)
          ),
        ),
        body: FutureBuilder (
          future: readJson(),
          builder: (context, AsyncSnapshot snapshot){
            {
              return ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, int index){
                   return ListTile(
                     leading: Text(_items[index]["name"].toString(), style:  const TextStyle(fontSize: 16.0 ,color: AppColors.GREY_COLOR),),
                      
                      trailing: Wrap(
                        spacing: 12, // space between two icons
                        children: <Widget>[
                          Badge(
                          toAnimate: false,
                          shape: BadgeShape.square,
                          badgeColor: AppColors.COUNT_COLOR,
                          borderRadius: BorderRadius.circular(4),
                          badgeContent: Text(_items[index]["count"].toString(), style: const TextStyle(color: AppColors.GREY_COLOR)),
                        ),// icon-1
                        IconButton(
              icon: Icon( selectedPrev ? Icons.navigate_next : Icons.title),
              onPressed: () {
                Navigator.push(context,
    MaterialPageRoute(builder: (context) => ChooseOwner()),);
              },
          ),
                        ],
                      ),
                  );
              });
            }
          }
        )
    );
  }
}