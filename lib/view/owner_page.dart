import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_project/model/entity/owner.dart';
import 'package:vet_project/pages/adding_animal_page.dart';

import '../resourses/app_constants.dart';
import 'owner_adding_animal.dart';

class OwnerPage extends  StatefulWidget {

  static const String routeName = "/owner_page";

  @override
  State<StatefulWidget> createState() =>
      _OwnerPage();

}

bool selectedPrev = true;
class _OwnerPage extends State<OwnerPage> {

  Owner? owner;


  @override
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {

    var person = ModalRoute.of(context)?.settings.arguments as String;

    var ownerJson = jsonDecode(person);

    setState(() {
      owner = Owner.fromJson(ownerJson);
    });

    super.didChangeDependencies();
  }

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

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(owner!.street, style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),),

                    const SizedBox(height: 4,),
                    Text(owner!.name + " " + owner!.surname, style:const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 120, 0, 1),
                    ),),

                    const SizedBox(height: 4,),
                    Text(owner!.phone, style:const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(255, 120, 0, 1),
                    ),),

                    const SizedBox(height: 12,),
                    const Text("Задание запущено", style: TextStyle(
                      fontSize: 14,
                      color: Color.fromRGBO(93, 105, 120, 1),
                    ),),

                    const SizedBox(height: 4,),
                    Text(owner!.status2_time, style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(padding: EdgeInsets.only(left: 16)),
                Text("ЗАРЕГЕСТРИРОВАНО", style: TextStyle(
                  fontSize: 12,
                  color: Color.fromRGBO(93, 105, 120, 1),
                ),),
              ],
            ),

            const SizedBox(height: 12,),
            const Divider(
              indent: 16.0,
              endIndent: 16.0,
              height: 0.5,
              color: Color.fromRGBO(220, 224, 229, 1),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 1,
              child: ListView(
                shrinkWrap: true,
                children:  [
                  Card(
                    child: ListTile(
                      title: const Text(
                        'Верблюды',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Всего ' + owner!.camel_count.toString(),
                        style: const TextStyle(fontSize: 14),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Text(
                        'Лошади',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Всего ' + owner!.horse_count.toString(),
                        style: const TextStyle(fontSize: 14),),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Text(
                        'МРС',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text('Всего ' + owner!.mrs_count.toString(),
                        style: const TextStyle(fontSize: 14),),
                    ),
                  ),
                ],
              ),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     ElevatedButton(
            //       onPressed: (){},
            //       child: const Text('Добавить животное',),
            //       style: ElevatedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(6),
            //         ),
            //         primary: Color.fromRGBO(255, 120, 0, 1),
            //
            //         textStyle:
            //         const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            //
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
      bottomSheet:
    Container(
    margin: const EdgeInsets.all(5),
    width: double.infinity,
      child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).pushNamed(AnimalAdding.routeName);
        },
        child: const Text('Добавить животное',),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          primary: Color.fromRGBO(255, 120, 0, 1),

          textStyle:
          const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),

          ),
        ),
      ),
    );
  }
}
