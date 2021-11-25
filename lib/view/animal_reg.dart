import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import '../model/api_clients/api_client.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'package:badges/badges.dart';
import 'package:vet_project/view/choose_owner.dart';

import '../app_constants.dart';
import '../model/entity/region.dart';


class AnimalRegistration extends StatefulWidget {
  const AnimalRegistration({Key? key}) : super (key: key);

  static const String routeName = "/animal_reg";
  @override
  State<StatefulWidget> createState() => 
  _AnimalRegistration();
}

class _AnimalRegistration extends State<AnimalRegistration> {

  List<Region> _items = [];
  // String token = '';
  //
  Future<List<Region>> getRegions() async {
    final String response = await rootBundle.rootBundle.loadString('lib/entities/sample_application_entities.json');
    final data = await json.decode(response) as List<dynamic> ;
    setState(() {
      _items = data.map((e) => Region.fromJson(e)).toList();
    });
    // List<Region> regions = data.map((data) => Region.fromJson(data)).toList();
    return data.map((e) => Region.fromJson(e)).toList();
  }



  //--------------------------------------------------------------------

  // final client = HttpClient();
  //
  // Future<List<Region>> getApiRegions() async{
  //   final json = await get('https://admin.vetqyzmet.kz/api/v1/getInfo') as List<dynamic>;
  //
  //
  //   setState(() {
  //         _items = json
  //             .map((dynamic r) => Region.fromJson(r as Map<String, dynamic>))
  //             .toList();
  //       });
  //
  //   return json.map((e) => Region.fromJson(e)).toList();
  // }




  // Future<void> getData(String tok) async {
  //   final response = await http.get('https://admin.vetqyzmet.kz/api/v5/getInfo', headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization' : 'Bearer $tok'
  //   });
  //   if (response.statusCode == 200) {
  //     final jsonD = json.decode(response.body);
  //     setState(() {
  //       _items = jsonD
  //           .map((dynamic r) => Region.fromJson(r as Map<String, dynamic>))
  //           .toList();
  //     });
  //
  //   }
  //   else {
  //     print('Not 200');
  //   }
  // }
  //
  // getUserData(String email, String password) async {
  //   Map data = {
  //     'email' : email,
  //     'password' : password
  //   };
  //   var response = await http.post('https://admin.vetqyzmet.kz/api/v1/auth', headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //   }, body: json.encode(data));
  //   var jsonData = null;
  //   if (response.statusCode == 200) {
  //     jsonData = json.decode(response.body);
  //     token = jsonData['token'];
  //     print(token);
  //     getData(token);
  //   }
  //   else {
  //     print('not 200');
  //   }
  //
  // }


  // Future<dynamic> get(String urlArg) async {
  //   final url = Uri.parse(urlArg);
  //   final request = await client.getUrl(url);
  //   final response = await request.close();
  //
  //   final jsonStrings = await response.transform(utf8.decoder).toList();
  //   final jsonString = jsonStrings.join();
  //   final dynamic json = jsonDecode(jsonString);
  //   return json;
  // }




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
        body: FutureBuilder<List<Region>> (
          future: getRegions(),
          builder: (context, data){
            var regionList = data.data;
            {
              return ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, int index){
                   return ListTile(
                     leading: Text(_items[index].locality_name, style:  const TextStyle(fontSize: 16.0 ,color: AppColors.GREY_COLOR),),
                      
                      trailing: Wrap(
                        spacing: 12, // space between two icons
                        children: <Widget>[
                          Badge(
                          toAnimate: false,
                          shape: BadgeShape.square,
                          badgeColor: AppColors.COUNT_COLOR,
                          borderRadius: BorderRadius.circular(4),
                          badgeContent: Text(_items[index].data.length.toString(), style: const TextStyle(color: AppColors.GREY_COLOR)),
                        ),// icon-1
                        IconButton(
              icon: Icon( selectedPrev ? Icons.navigate_next : Icons.title),
              onPressed: () {
                Navigator.of(context).pushNamed(ChooseOwner.routeName, arguments: jsonEncode(_items[index].data));
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