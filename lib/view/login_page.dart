import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'fastPassword.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Lab2';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _SphlashScreen();
}
class _SphlashScreen extends State<MyStatefulWidget> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => NextPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png',
              width: 183,
              height: 116,
            ),
          ],
        )
      ),
    );
  }

}

class HomePage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<HomePage> {
  var token;
  final myController = TextEditingController();
  final myControllerForPass = TextEditingController();


  String retMonth(String month) {
    if (month == '01') {
      return 'Января';
    }
    else if (month == '02') {
      return 'Февраля';
    }
    else if (month == '03') {
      return 'Марта';
    }
    else if (month == '04') {
      return 'Апреля';
    }
    else if (month == '05') {
      return 'Мая';
    }
    else if (month == '06') {
      return 'Июня';
    }
    else if (month == '07') {
      return 'Июля';
    }
    else if (month == '08') {
      return 'Августа';
    }
    else if (month == '09') {
      return 'Сентября';
    }
    else if (month == '10') {
      return 'Октября';
    }
    else if (month == '11') {
      return 'Ноября';
    }
    else {
      return 'Декабря';
    }
  }
  String returnDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    var dates = formattedDate.split("-");
    String month = dates[1];
    String day = int.parse(dates[2]).toString();
    return day + ' ' + retMonth(month);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: prefer_const_constructors
          TextContainer(
            child: Text(
              'Вход в систему',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)
            ),
          ),
          TextContainer(
            child: Text(
              'Сегодня ' + returnDate()
            )
          ),
          TextContainer(
          child:Text(
            'Логин',
            style: TextStyle(color: Colors.black54),
          ),
          ),
          TextFieldContainer(
              child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'uabikhan@gmail.com'
                  ),
                controller: myController,
              ),
            ),
          TextContainer(
            child: Text(
            'Пароль',
              style: TextStyle(color: Colors.black54),
          ),
          ),
          TextFieldContainer(
            child: TextField(
              obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                ),
              controller: myControllerForPass,
            ),
          ),
          ButtonFieldContainer(
            child : TextButton(
            child: Text(
                'Войти',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              getUserData(myController.text, myControllerForPass.text);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
            ),
          )
          ),
        ],
      ),
    );
  }

  signIn(String email, String password) async {
    Map data = {
      'email' : email,
      'password' : password
    };
    var jsonData = null;
    var response = await http.post('https://reqres.in/api/login', body: data);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      token = jsonData['token'];
      print(token);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StaticApp()),
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect login'),
      ));
    }
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StaticApp()),
      );
    }
    else {
      print('not 200');
    }

  }
}

class TextFieldContainer extends StatelessWidget{
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 52,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }
  
}


class ButtonFieldContainer extends StatelessWidget{
  final Widget child;
  const ButtonFieldContainer({
    Key? key,
    required this.child,
  }) : super(key:key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 52,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }
}

class TextContainer extends StatelessWidget{
  final Widget child;
  const TextContainer({
    Key? key,
    required this.child,
  }) : super(key:key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }

}

