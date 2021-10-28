import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class NextPage extends StatefulWidget {
  @override
  _Page createState() => _Page();
}

class _Page extends State<NextPage> {
  String first = '';
  String second = '';
  String third = '';
  String fourth = '';
  int index = 0;
  String current = '';
  String password = '5555';

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
      }
      else if (index == 2) {
        second = '*';
      }
      else if (index == 3) {
        third = '*';
      }
      else {
        fourth = '*';
        if (current == password) {
          Timer(Duration(seconds: 1), () {
            setState(() {
              index = 0;
              current = '';
              first = '';
              second = '';
              third = '';
              fourth = '';
            });
            Navigator.push(context,MaterialPageRoute(builder: (context) => (HomePage())));
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
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Incorrect'),
            ));
          });
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
      }
      else if (index == 1) {
        second = '';
      }
      else if (index == 2) {
        third = '';
      }
      else if (index == 3){
        fourth = '';
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Column(
          children: [
            Text('Hello'),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text('$first', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('$second', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('$third', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text('$fourth', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                ]
            ),

            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {zhan('1');},
                      child: Text('1', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {zhan('2');},
                      child: Text('2', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {zhan('3');},
                      child: Text('3', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                ]
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {zhan('4');},
                      child: Text('4', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {zhan('5');},
                      child: Text('5', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {zhan('6');},
                      child: Text('6', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                ]
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {zhan('7');},
                      child: Text('7', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {zhan('8');},
                      child: Text('8', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {zhan('9');},
                      child: Text('9', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                ]
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text('F', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {zhan('0');},
                      child: Text('0', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                  TextButton(
                      onPressed: () {oshir();},
                      child: Text('B', style: TextStyle(color: Colors.black),),
                      style: ButtonStyle(overlayColor: MaterialStateColor.resolveWith((states) => Colors.orange), backgroundColor: MaterialStateProperty.all<Color>(Colors.black12), minimumSize: MaterialStateProperty.all<Size>(Size(48,48)) ,shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)
                          )
                      )
                      )
                  ),
                ]
            ),
          ],
        )
    );
  }
}