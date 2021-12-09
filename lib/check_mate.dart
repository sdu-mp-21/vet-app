
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vet_project/view/main_screen.dart';

class MyApp extends StatelessWidget {
  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
          width: 1,
          color: Colors.black87
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: ThemeData(backgroundColor: Colors.white ),
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),

          body: SafeArea(

            child: Center(

              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Image.asset('lib/assets/img/check_mark.png',
                    width: 140,
                    height: 102,),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    'Данные отправлены',
                    style: TextStyle(fontSize: 24,
                        fontWeight: FontWeight.w500),

                  ),
                  SizedBox(
                    height: 235,
                  ),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 170
                      ),
                      color: Colors.black12,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
                      },
                      child: Text('Главное',
                        style: TextStyle(fontSize:17 ,
                          fontWeight: FontWeight.w500,
                        ),

                      )
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 170
                      ),
                      color: Colors.orange,
                      onPressed: () {},
                      child: Text('Завершить',
                        style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.w400),
                      )
                  )


                ],

              ),
            ),
          ),
        )


    );




  }
}

