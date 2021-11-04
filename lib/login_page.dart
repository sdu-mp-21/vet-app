import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'main.dart';
import 'fastPassword.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  getFastPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? str = preferences.getString('fastPassword');
    return str;
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
class nextPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<nextPage> {
  Duration duration = Duration();
  Timer? timer;
  String change = 'Start';

  @override
  void initState() {
    super.initState();

    //startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      setState(() => timer?.cancel());
    }
    else {
      setState(() => timer?.cancel());
      reset();
    }
  }

  void reset() {
    setState(() => duration = Duration());
  }
  void addTime() {
    setState(() {
      final seconds = duration.inSeconds + 1;

      duration = Duration(seconds: seconds);
    });
  }

  void closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Dialog'),
                content: Text('Are you sure?'),
                actions: [
                  FlatButton(
                    onPressed: () { Navigator.of(context).pop(); Navigator.of(context).pop(); },
                    child: Text('Yes'),
                  ),
                  FlatButton(
                    onPressed: () { closeDialog(); },
                    child: Text('No'),
                  ),
                ],
              ),
          ),
        ),
        title: Text('Count up timer'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTime(),
              buildButton(),
            ],
        ),
      ),
    );
  }

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$minutes:$seconds',
      style: TextStyle(fontSize: 80),
    );
  }

  Widget buildButton() {
    final isRuning = timer == null ? false : timer!.isActive;

    return isRuning
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          child: Text('STOP'),
          onPressed: () {
            if (isRuning) {
              stopTimer(resets: false); change = 'Start';
            }
          },
        ),
        TextButton(
          child: Text('PAUSE'),
          onPressed: () {
            if (isRuning) {
              stopTimer(resets: true); change = 'Resume';
            }
          },
        ),
      ]
    )
        : TextButton(
            onPressed: () { startTimer();},
            child: Text('$change'),

    );

  }

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
              signIn(myController.text, myControllerForPass.text);
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


