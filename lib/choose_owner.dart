import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'owner_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:badges/badges.dart';
// import 'package:vet_project/owner_page_dynamic.dart';

import 'app_constants.dart';

class ChooseOwner extends  StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
  _ChooseOwner();
  
}
class _ChooseOwner extends State<ChooseOwner> {
   List _items = [];


  Future<void> readJson() async {
    final String responce = await rootBundle.loadString('lib/entities/sample_application_entities.json');
    final data = await json.decode(responce);
    setState(() {
      _items = data['data'];
    });
}


 bool selectedPrev = true;
  bool selectedNext = true;
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
        title:const Text("с.Аккала", style: TextStyle(color: AppColors.GREY_COLOR)),
        // centerTitle: true,
        shape: Border(bottom: BorderSide(
          color: Colors.grey[350]!, 
          width: 2)
          ),
        ),
        body:
     
      FutureBuilder (
          future: readJson(),
          builder: (context, AsyncSnapshot snapshot){
            {
              return ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, int index){
                   return ListTile(
                     title: Text(_items[index]["street"].toString() + " " + _items[index]["home"].toString(), style:  const TextStyle(fontSize: 16.0 ,color: AppColors.GREY_COLOR),),
                      subtitle: Text(_items[index]["name"].toString() + " " + _items[index]["surname"].toString(), style: TextStyle(fontSize: 14.0 ,color: Colors.grey[450]),),
                       trailing:  const Icon(Icons.navigate_next_outlined),
    //                   IconButton(
    //                     icon: Icon( selectedPrev ? Icons.navigate_next : Icons.title),
     //   onPressed: () {
    //             Navigator.push(context,
    // MaterialPageRoute(builder: (context) => OwnerPage()),);
    //           },
    //                 ),
                     onTap: () {
                       Navigator.push(context,
                            MaterialPageRoute(builder: (context) => owner_page()),);
                     },
                  );
                });
            }
          }
        ),
 );
  }
  }
