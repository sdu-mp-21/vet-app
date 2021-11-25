import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NextPage extends StatefulWidget {
  @override
  _Page createState() => _Page();
}

class _Page extends State<NextPage> {
  String first = '';
  String second = '';
  String third = '';
  String fourth = '';
  String description = 'Введите код быстрого доступа';
  String firstGray = 'lib/assets/img/gray_round.png';
  String secondGray = 'lib/assets/img/gray_round.png';
  String thirdGray = 'lib/assets/img/gray_round.png';
  String fourthGray = 'lib/assets/img/gray_round.png';
  int index = 0;
  String pref = '';
  String current = '';
  String password = '5555';

  getFastPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? str = preferences.getString('fastPassword');
    pref = str!;
  }

  setFastPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('fastPassword', current);
  }
  void zhan(String which) {
    index++;
    if (index >= 5) {
      index = 4;
    }
    if (index <= 4) {
      current = current + which;
    }
    setState(() {
      if (index == 1) {
        first = '*';
        firstGray = 'lib/assets/img/orange_round.png';
      }
      else if (index == 2) {
        second = '*';
        secondGray = 'lib/assets/img/orange_round.png';
      }
      else if (index == 3) {
        third = '*';
        thirdGray = 'lib/assets/img/orange_round.png';
      }
      else {
        fourth = '*';
        fourthGray = 'lib/assets/img/orange_round.png';
        var pass = pref;
        if (pass.length != 4) {
          setFastPassword();
          Timer(Duration(seconds: 1), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => (HomePage())));
          });
        }
        else {
          if (current == pass) {
            Timer(Duration(seconds: 1), () {
              setState(() {
                index = 0;
                current = '';
                first = '';
                second = '';
                third = '';
                fourth = '';
                firstGray = 'lib/assets/img/gray_round.png';
                secondGray = 'lib/assets/img/gray_round.png';
                thirdGray = 'lib/assets/img/gray_round.png';
                fourthGray = 'lib/assets/img/gray_round.png';
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (HomePage())));
            });
          }
          else {
            Timer(Duration(seconds: 1), () {
              setState(() {
                index = 0;
                current = '';
                first = '';
                second = '';
                third = '';
                fourth = '';
                firstGray = 'lib/assets/img/gray_round.png';
                secondGray = 'lib/assets/img/gray_round.png';
                thirdGray = 'lib/assets/img/gray_round.png';
                fourthGray = 'lib/assets/img/gray_round.png';
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Incorrect'),
              ));
            });
          }
        }

      }
    });
  }

  void oshir() {
    index--;
    if (index < 0) {
      index = 0;
    }
    current = current.substring(0, index);
    setState(() {
      if (index == 0) {
        first = '';
        firstGray = 'lib/assets/img/gray_round.png';

      }
      else if (index == 1) {
        second = '';
        secondGray = 'lib/assets/img/gray_round.png';
      }
      else if (index == 2) {
        third = '';
        thirdGray = 'lib/assets/img/gray_round.png';
      }
      else if (index == 3){
        fourth = '';
        fourthGray = 'lib/assets/img/gray_round.png';
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    getFastPassword();

    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('$description'),
            Container(margin: EdgeInsets.only(bottom: 180, top: 10) ,child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.symmetric(horizontal: 6) ,child: Image.asset(
                    '$firstGray',
                    width: 18,
                    height: 18,
                  ),),
                  Container(margin: EdgeInsets.symmetric(horizontal: 6) ,child: Image.asset(
                    '$secondGray',
                    width: 18,
                    height: 18,
                  ),),
                  Container(margin: EdgeInsets.symmetric(horizontal: 6), child: Image.asset(
                    '$thirdGray',
                    width: 18,
                    height: 18,
                  ),),
                  Container(margin: EdgeInsets.symmetric(horizontal: 6) ,child: Image.asset(
                    '$fourthGray',
                    width: 18,
                    height: 18,
                  ),)

                ]
            ),),

            Container(margin: EdgeInsets.only(bottom: 10), child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(margin: EdgeInsets.symmetric(horizontal: 5) ,child: TextButton(
                      onPressed: () {zhan('1');},
                      child: Text('1', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
                  Container(margin: EdgeInsets.symmetric(horizontal: 5) ,child: TextButton(
                      onPressed: () {zhan('2');},
                      child: Text('2', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
                  Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {zhan('3');},
                      child: Text('3', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
                ]
            ),),
            Container(margin: EdgeInsets.only(bottom: 10), child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {zhan('4');},
                      child: Text('4', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
      Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {zhan('5');},
                      child: Text('5', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
      Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {zhan('6');},
                      child: Text('6', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
                ]
            ),),
            Container(margin: EdgeInsets.only(bottom: 10), child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {zhan('7');},
                      child: Text('7', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
      Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {zhan('8');},
                      child: Text('8', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
      Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {zhan('9');},
                      child: Text('9', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
                ]
            ),),
            Container(margin: EdgeInsets.only(bottom: 44),
               child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {},
                      child: Text('F', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
      Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {zhan('0');},
                      child: Text('0', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
      Container(margin: EdgeInsets.symmetric(horizontal: 5),child: TextButton(
                      onPressed: () {oshir();},
                      child: Text('B', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),),
                ]
            ),),
          ],
        )
    );
  }
}