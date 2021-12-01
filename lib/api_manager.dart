import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'model/entity/region.dart';
import 'view/main.dart';

class ApiManager {
  String token = '';
  int stateId = 92;
  int type = 1;
  String mainUrl = "https://admin.vetqyzmet.kz/api";

  setToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }

  getUserData(String email, String password) async {
    Map data = {
      'email' : email,
      'password' : password
    };
    var response = await http.post('https://admin.vetqyzmet.kz/api/v1/auth', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: json.encode(data));
    var jsonData = null;
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      token = jsonData['token'];
      print('200');
      print(token);

    }
    else {
      print('not 200');
    }

  }
  getData(String tok) async {
    var response = await http.get('https://admin.vetqyzmet.kz/api/v5/getInfo', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $tok'
    });
    var jsonData = null;
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(jsonData);

    }
    else {
      print('Not 200');
    }
  }

  // Future<List<Region>> getRegions(String tok) async {
  //   var response = await await http.get('https://admin.vetqyzmet.kz/api/v5/getInfo', headers: <String, String>{
  //     'Content-Type': 'application/json; charset=UTF-8',
  //     'Authorization' : 'Bearer $tok'
  //   });
  //   final data = await json.decode(response.body) as List<dynamic> ;
  //   setState(() {
  //     _items = data.map((e) => Region.fromJson(e)).toList();
  //   });
  //   // List<Region> regions = data.map((data) => Region.fromJson(data)).toList();
  //   return data.map((e) => Region.fromJson(e)).toList();
  // }



  getTypes() async {
    var response = await http.post('https://admin.vetqyzmet.kz/api/animalTypes', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token'
    });
    var jsonData = null;
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(jsonData);

    }
    else {
      print('Not 200');
    }
  }

  getBreed() async {
    var response = await http.post('https://admin.vetqyzmet.kz/api/breed', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token'
    });
    var jsonData = null;
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(jsonData);

    }
    else {
      print('Not 200');
    }
  }

  getDirection() async {
    var response = await http.post('https://admin.vetqyzmet.kz/api/suit', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token'
    });
    var jsonData = null;
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(jsonData);
    }
    else {
      print('Not 200');
    }
  }

  getByType() async {
    var response = await http.get('https://admin.vetqyzmet.kz/api/v6/tasksByStatement/$stateId?animal_type_id=$type', headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization' : 'Bearer $token'
    });

    var jsonData = null;
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      var listData = jsonData as List;
      String type = listData[0].animal_type;
      String urlToPhoto = listData[0].photo1;
      String name = listData[0].name;
      String gender = listData[0].gender;
      String ING = listData[0].ING;
      String breed = listData[0].breed;
      String suit = listData[0].suit;
      String dateOfBirth = listData[0].Date_Of_Birth;

      print(jsonData);
    }
    else {
      print('Not 200');
    }

  }
}
