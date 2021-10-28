import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vet_project/app_constants.dart' ;

import 'main_drawer.dart';
import 'main_listview.dart'; 

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.GREY_COLOR),
        elevation: 0,
        title:const Text("VetQyzmet", style: TextStyle(color: AppColors.GREY_COLOR)),
        centerTitle: true,
        actions: const [
          IconButton(
            icon:  Icon(Icons.logout, color: AppColors.GREY_COLOR),
                padding: EdgeInsets.only(right: 10.0),
                onPressed: null),
        ],
        shape: Border(bottom: BorderSide(
          color: Colors.grey[350]!, 
          width: 2)
          ),
        ),
      body: const MainListView()
    );
  }
  
}