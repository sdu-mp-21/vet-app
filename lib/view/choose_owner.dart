import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:badges/badges.dart';
import 'package:vet_project/model/entity/owner.dart';
import 'package:vet_project/owner_page_with_camera.dart';
import 'package:vet_project/view/owner_page.dart';
// import 'package:vet_project/owner_page_dynamic.dart';

import '../app_constants.dart';

class ChooseOwner extends  StatefulWidget {

  static const String routeName = "/choose_owner";

  @override
  State<StatefulWidget> createState() =>
  _ChooseOwner();
  
}
class _ChooseOwner extends State<ChooseOwner> {
   // List _items = [];
//
//    String token = '';
//
//
//   Future<void> readJson() async {
//     final String responce = await rootBundle.loadString('lib/entities/sample_application_entities.json');
//     final data = await json.decode(responce);
//     setState(() {
//       _items = data['data'];
//     });
// }
//
//
//
//
 bool selectedPrev = true;
  bool selectedNext = true;
//
//   getData(String tok) async {
//     var response = await http.get('https://admin.vetqyzmet.kz/api/v5/getInfo', headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization' : 'Bearer $tok'
//     });
//     var jsonData = null;
//     if (response.statusCode == 200) {
//       jsonData = json.decode(response.body);
//       _items = jsonData['data'];
//       print(jsonData);
//
//     }
//     else {
//       print('Not 200');
//     }
//   }
//
//    getUserData(String email, String password) async {
//      Map data = {
//        'email' : email,
//        'password' : password
//      };
//      var response = await http.post('https://admin.vetqyzmet.kz/api/v1/auth', headers: <String, String>{
//        'Content-Type': 'application/json; charset=UTF-8',
//      }, body: json.encode(data));
//      var jsonData = null;
//      if (response.statusCode == 200) {
//        jsonData = json.decode(response.body);
//        token = jsonData['token'];
//        print(token);
//        getData(token);
//      }
//      else {
//        print('not 200');
//      }
//
//    }

  List<Owner>? owners;


  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {

    var list = ModalRoute.of(context)?.settings.arguments as String;

    final ownersJson = json.decode(list) as List<dynamic>;

    setState(() {
      owners = ownersJson.map((e) => Owner.fromJson(e)).toList();
    });

    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    // getUserData('email', 'password');

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
        body: ListView.builder(

                   itemCount: owners!.length,
                   itemBuilder: (context, int index){
                      return ListTile(
                        title: Text(owners![index].street.toString() + " " + owners![index].home.toString(), style:  const TextStyle(fontSize: 16.0 ,color: AppColors.GREY_COLOR),),
                         subtitle: Text(owners![index].name.toString() + " " + owners![index].surname.toString(), style: TextStyle(fontSize: 14.0 ,color: Colors.grey[450]),),
                          trailing:
                          // const Icon(Icons.navigate_next_outlined)
       //                   IconButton(
       //                     icon: Icon( selectedPrev ? Icons.navigate_next : Icons.title),
       //                     onPressed: () {
       //             Navigator.push(context,
       // MaterialPageRoute(builder: (context) => OwnerPage()),);
       //           },
       //                 ),
                          IconButton(
                            icon: Icon( selectedPrev ? Icons.navigate_next : Icons.title),
                            onPressed: () {
                              Navigator.of(context).pushNamed(OwnerPage.routeName, arguments: jsonEncode(owners![index]));
                            },
                          ),
                     );
                   })









    //   FutureBuilder (
    //       future: readJson(),
    //       builder: (context, AsyncSnapshot snapshot){
    //         {
    //           return ListView.builder(
    //             itemCount: _items.length,
    //             itemBuilder: (context, int index){
    //                return ListTile(
    //                  title: Text(_items[index]["street"].toString() + " " + _items[index]["home"].toString(), style:  const TextStyle(fontSize: 16.0 ,color: AppColors.GREY_COLOR),),
    //                   subtitle: Text(_items[index]["name"].toString() + " " + _items[index]["surname"].toString(), style: TextStyle(fontSize: 14.0 ,color: Colors.grey[450]),),
    //                    trailing:  const Icon(Icons.navigate_next_outlined)
    // //                   IconButton(
    // //                     icon: Icon( selectedPrev ? Icons.navigate_next : Icons.title),
    // //                     onPressed: () {
    // //             Navigator.push(context,
    // // MaterialPageRoute(builder: (context) => OwnerPage()),);
    // //           },
    // //                 ),
    //               );
    //             });
    //         }
    //       }
    //     ),
 );
  }
  }
