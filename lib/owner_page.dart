import 'package:flutter/material.dart';

class Abzal extends StatelessWidget {
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
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
        ), // Icon
        title: const Text(
          'Страница Собственника',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Евгений Кориенко',
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                  Text(
                    '87088766553',
                    style: TextStyle(color: Colors.deepOrangeAccent),
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
                      title: Text('Задание запущено'),
                      subtitle: Text('2 дня и 6 часов 1 минуту назад'),
                    ),
                  ),
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
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('Всего 30'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Лошодей',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('Всего 30'),
                      isThreeLine: true,
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(
                        'МРС',
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text('Всего 30'),
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