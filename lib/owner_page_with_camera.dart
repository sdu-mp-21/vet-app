import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'resourses/app_constants.dart';
import 'camera.dart';

class owner_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Myapp",
      home: HomePage(),
    );
  }
}

bool selectedPrev = true;

class OwnerPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.GREY_COLOR),
        elevation: 0,
        leading: IconButton(
          icon: Icon( selectedPrev ? Icons.arrow_back : Icons.title),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:const Text("Страница Собственника", style: TextStyle(color: AppColors.GREY_COLOR)),
        centerTitle: true,
        shape: Border(bottom: BorderSide(
            color: Colors.grey[350]!,
            width: 2)
        ),
      ),

      // appBar: AppBar(
      //
      //   leading: const Icon(
      //     Icons.arrow_back_rounded,
      //     color: Colors.black,
      //   ), // Icon
      //   title: const Text(
      //     'Страница Собственника',
      //     style: TextStyle(
      //       fontSize: 20,
      //       color: Colors.black,
      //     ),
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        child: Column(


          children: [
            ElevatedButton(child: Text("Добавить животное",),
                onPressed:(){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => camera_page()),);
                }),

            const  SizedBox(
              height: 15.0,
            ),



            Container(

              alignment: Alignment.center,
              child: Column(
                children: const [

                  Text(
                    'Ерубаева 7, 2',
                    style: TextStyle(
                        fontSize: 20,height: 1.5 ,color: Colors.black
                    ),
                  ),
                  Text(
                    'Евгений Кориенко',
                    style: TextStyle(fontSize: 20,height: 1.5 ,color: Colors.deepOrangeAccent),
                  ),
                  Text(
                    '87088766553',
                    style: TextStyle(fontSize: 20,height: 1.5 ,color: Colors.deepOrangeAccent),
                  ),
                  Text(
                    'Задание запущено',
                    style: TextStyle(height: 2.5,fontSize: 15),
                  ),
                  Text(
                    '2 дня и 6 часов 1 минуту назад',
                    style: TextStyle(fontSize: 20,color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: ListView(
                shrinkWrap: true,
                children: const [

                  Card(
                    child: ListTile(
                      title: Text('ЗАРЕГЕСТРИРОВАН'),
                      dense: true,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Верблюдов',
                        style: TextStyle(fontSize: 20,color: Colors.black),
                      ),
                      subtitle: Text('Всего 30'),
                      trailing: Text('Сегодня 30'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Лошодей',
                        style: TextStyle(fontSize: 20,color: Colors.black),
                      ),
                      subtitle: Text('Всего 30'),
                      trailing: Text('Сегодня 30'),
                      isThreeLine: true,
                    ),
                  ),

                  Card(
                    child: ListTile(
                      title: Text(
                        'МРС',
                        style: TextStyle(fontSize: 20,color: Colors.black),
                      ),
                      subtitle: Text('Всего 30'),
                      trailing: Text('Сегодня 30'),


                    ),




                  ),


                ],



              ),


            ),

          ],
        ),

      ),


    );

  }
}
