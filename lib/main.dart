import 'package:flutter/material.dart';
import 'package:vet_project/animal_registration.dart';

import 'animal_reg.dart';
import 'main_screen.dart';


void main() => runApp(StaticApp());
class StaticApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 home: MainScreen(),
 );
 }
}

