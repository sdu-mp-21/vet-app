import 'package:flutter/material.dart';
import 'package:vet_project/pages/adding_animal_page.dart';
import 'package:vet_project/view/choose_owner.dart';
import 'package:vet_project/view/owner_page.dart';



import 'animal_reg.dart';
import 'main_screen.dart';
import 'login_page.dart';
import 'owner_adding_animal.dart';

void main() => runApp(MyApp());

// Main page
class StaticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      routes: {
        AnimalRegistration.routeName: (context) => AnimalRegistration(),
        ChooseOwner.routeName: (context) => ChooseOwner(),
        OwnerPage.routeName: (context) => OwnerPage(),
        AnimalAdding.routeName: (context) => AnimalAdding(),
        AddingAnimalPage.routeName: (context) => AddingAnimalPage()
      },
    );
  }
}
