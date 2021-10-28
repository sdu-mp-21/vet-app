import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registration_page.dart';

void main() => runApp(RegisterAnimalSide());

class RegisterAnimalSide extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vet Qyzmet',
        theme: ThemeData(
            primaryColor: Colors.white,
            textTheme: TextTheme(subtitle1: TextStyle(color: Colors.white))
        ),
        home: HomePage()
    );
  }
}


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Icon(Icons.arrow_back_rounded, color: Colors.black),
            backgroundColor: Colors.white,
            title: Text("c. Аккала",
                style:(TextStyle(color: Colors.black))) ,
          ),
          body: PageRegistration(),
        )
    );
  }
}