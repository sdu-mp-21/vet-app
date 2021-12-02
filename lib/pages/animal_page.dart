import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AnimalPage();
}

class _AnimalPage extends State<AnimalPage> {

  TextStyle grayText = TextStyle(fontSize: 14, color: Color.fromRGBO(105, 125, 149, 1));
  TextStyle blackText = TextStyle(fontSize: 14, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:const Text("Карты", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        shape: Border(bottom: BorderSide(
            color: Colors.grey[350]!,
            width: 2)
        ),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20),
          children: [
            buildCard(),
            buildCard(),
            buildCard()
          ]),
        

    );

  }

  Widget buildCard() => Card(
    shadowColor: Colors.red,
    elevation: 10,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    ),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.orange, Colors.orangeAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network("https://picsum.photos/250?image=9", fit: BoxFit.cover, width: double.infinity,),
          Row(
            children: [
              Text("ING", style: grayText,),
              Text("Baha", style: blackText),
            ],
          ),
        ],
      ),
    ),
  );

}
