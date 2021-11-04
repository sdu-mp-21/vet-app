import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
        home: OwnerPage(),
        debugShowCheckedModeBanner: false
    ));

class OwnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Myapp",
      home: Owner(),
    );
  }
}

class Owner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ),
        title: const Text(
          'Страница Собственника',

          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Ерубаева 7, 2", style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),),

                    SizedBox(height: 4,),
                    Text("Евгений Кориенко", style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 120, 0, 1),
                    ),),

                    SizedBox(height: 4,),
                    Text("87085776672", style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 120, 0, 1),
                    ),),

                    SizedBox(height: 12,),
                    Text("Задание запущено", style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(93, 105, 120, 1),
                    ),),

                    SizedBox(height: 4,),
                    Text("2 дня и 6 часов 1 мунут назад", style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),),
                ],
               ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(left: 16)),
                Text("ЗАРЕГЕСТРИРОВАНО", style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(93, 105, 120, 1),
                ),),
              ],
            ),

            SizedBox(height: 12,),
            Divider(
              indent: 16.0,
              endIndent: 16.0,
              height: 0.5,
              color: Color.fromRGBO(220, 224, 229, 1),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: ListView(
                shrinkWrap: true,
                children: const [
                  Card(
                    child: ListTile(
                      title: Text(
                        'Лошодей',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Всего 30',
                        style: TextStyle(fontSize: 14),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Лошодей',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Всего 30',
                        style: TextStyle(fontSize: 14),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Лошодей',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Всего 30',
                        style: TextStyle(fontSize: 14),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Лошодей',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Всего 30',
                        style: TextStyle(fontSize: 14),),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  child: const Text('Добавить животное',),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    primary: Color.fromRGBO(255, 120, 0, 1),

                    textStyle:
                        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
