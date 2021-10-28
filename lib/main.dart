import 'package:flutter/material.dart';

import 'main_screen.dart';
import 'login_page.dart';


void main() => runApp(MyApp());
class StaticApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 home: MainScreen(),
 );
 }
}

