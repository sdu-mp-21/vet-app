import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:vet_project/model/entity/breed.dart';
import 'package:vet_project/model/entity/suit.dart';
import 'package:vet_project/model/entity/animal_type.dart';
import '../resourses/app_constants.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:vet_project/camera.dart';

import 'package:flutter/services.dart' as rootBundle;

class AnimalAdding extends StatefulWidget {

  static const String routeName = "/owner_adding_animal_page";

  AnimalAdding({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _AnimalAdding();


}

class _AnimalAdding extends State<AnimalAdding> {

  final _formKey = GlobalKey<FormBuilderState>();
  String token = '';

  @override
  void initState() {
    getAnimalType();
    getSuits();
    getBreed();
    super.initState();
  }


  String? selectedType;
  String? selectedSuit;
  String? selectedBreed;
  List<Suit> suit = [];
  List<Breed> breed = [];
  String? gender;
  String? typeId;
  String? animal_birthday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.GREY_COLOR),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
            "Добавить животное", style: TextStyle(color: AppColors.GREY_COLOR)),
        centerTitle: true,
        shape: Border(bottom: BorderSide(
            color: Colors.grey[350]!,
            width: 2)
        ),
      ),
      body:
      FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _myAnimalType,
                    items: _animalType.map((e) {
                      return DropdownMenuItem<String>(
                        child: Text(e.name),
                        value: e.name,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      selectedSuit = null;
                      selectedBreed = null;
                      // _myAnimalType = newValue;
                      if (newValue == "Крупный рогатый скот") suit = getSuitOfSelectedAnimalType(1);
                      if (newValue == "Мелкий рогатый скот") suit = getSuitOfSelectedAnimalType(2);
                      if (newValue == "Лошадь") suit = getSuitOfSelectedAnimalType(3);
                      if (newValue == "Свинья") suit = getSuitOfSelectedAnimalType(4);
                      if (newValue == "Верблюд") suit = getSuitOfSelectedAnimalType(5);
                      setState(() {
                        _myAnimalType = newValue;
                      });
                    },
                    hint: Container(
                      width: 150, //and here
                      child: const Text(
                        "Select Animal's Type",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),

                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedSuit,
                    items: suit.map((e) {
                      return DropdownMenuItem<String>(
                        child: Text(e.name),
                        value: e.name,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      selectedBreed = null;
                      if (newValue == "Молочный") breed = getBreedOfSelectedSuit(1);
                      if (newValue == "Молочно-мясной") breed = getBreedOfSelectedSuit(2);
                      if (newValue == "Мясной") breed = getBreedOfSelectedSuit(3);
                      if (newValue == "Грубошерстный") breed = getBreedOfSelectedSuit(4);
                      if (newValue == "Каракульские") breed = getBreedOfSelectedSuit(5);
                      if (newValue == "Полугрубошерстный") breed = getBreedOfSelectedSuit(7);
                      if (newValue == "Тонкорунный") breed = getBreedOfSelectedSuit(8);
                      if (newValue == "Полутонкорунный") breed = getBreedOfSelectedSuit(9);
                      if (newValue == "Прочие") breed = getBreedOfSelectedSuit(10);
                      if (newValue == "Верхово-упряжные") breed = getBreedOfSelectedSuit(11);
                      if (newValue == "Верховые") breed = getBreedOfSelectedSuit(12);
                      if (newValue == "Рысистые") breed = getBreedOfSelectedSuit(13);
                      if (newValue == "Тяжелоупряжные и местные") breed = getBreedOfSelectedSuit(14);
                      if (newValue == "Продуктивный") breed = getBreedOfSelectedSuit(17);
                      if (newValue == "Прочие") breed = getBreedOfSelectedSuit(18);
                      if (newValue == "Молочный") breed = getBreedOfSelectedSuit(19);
                      if (newValue == "Мясо-шерстный") breed = getBreedOfSelectedSuit(20);
                      setState(() {
                        selectedSuit = newValue;
                      });
                    },
                    hint: Container(
                      width: 150, //and here
                      child: const Text(
                        "Select Animal's Breed",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedBreed,
                    items: breed.map((e) {
                      return DropdownMenuItem<String>(
                        child: Text(e.name),
                        value: e.name,
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedBreed = val;
                      });
                    },
                    hint: Container(
                      width: 150, //and here
                      child: const Text(
                        "Select Animal's Purpose",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  FormBuilderTextField(
                    onChanged: (value){
                      setState(() {
                        typeId = value!;
                      });
                    },
                    name: "animal-id",
                    validator: FormBuilderValidators.integer(context),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                        borderSide: BorderSide(color: AppColors.MAIN_COLOR),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      filled: true,
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Type ID",
                      fillColor: AppColors.BACKGROUND_COLOR,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  FormBuilderRadioGroup(
                    onChanged: (value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
                    name: "animal-sex",
                    options: const [
                      FormBuilderFieldOption(
                        value: "Male", child: Text("Male"),),
                      FormBuilderFieldOption(
                        value: "Female", child: Text("Female"),)
                    ],
                  ),
                  const SizedBox(height: 20,),
                  FormBuilderDateTimePicker(
                    onChanged: (value) {
                      setState(() {
                        animal_birthday = value.toString();
                      });
                    },
                    name: "animal-birth",
                    decoration: const InputDecoration(
                      labelText: "Date of birth",
                    ),
                  ),
                  const SizedBox(height: 155,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        child: const Text('Cancel'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(167, 55),
                          textStyle: const TextStyle(fontSize: 20),
                          primary: const Color(0XffDCE0E5),
                          onPrimary: AppColors.GREY_COLOR,
                          side: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        onPressed: () {
                          _formKey.currentState!.reset();
                          print(gender);
                          print(animal_birthday);
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(167, 55),
                          textStyle: const TextStyle(fontSize: 20),
                          primary: AppColors.MAIN_COLOR,
                          onPrimary: Colors.white,
                        ),
                        child: const Text('Next'),
                        onPressed: () {
                          animal_birthday = animal_birthday!.replaceRange(15, 22, '');
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(selectedType: _myAnimalType, typeId: typeId, selectedSuit: selectedSuit, gender: gender, animal_birthday: animal_birthday,selectedBreed: selectedBreed,)));
                        },
                      ),
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

  List<Suit> _suit = [];
  String? _mySuit;

  Future<List<Suit>> getSuits() async {
    final String response = await rootBundle.rootBundle.loadString('lib/entities/sample_suit.json');
    final data = await json.decode(response) as List<dynamic> ;
    print(data);
    setState(() {
      _suit = data.map((e) => Suit.fromJson(e)).toList();
    });
    return data.map((e) => Suit.fromJson(e)).toList();
  }

  List<Breed> _breed = [];
  String? _myBreed;

  Future<List<Breed>> getBreed() async {
    final String response = await rootBundle.rootBundle.loadString('lib/entities/sample_breed.json');
    final data = await json.decode(response) as List<dynamic> ;
    print(data);
    setState(() {
      _breed = data.map((e) => Breed.fromJson(e)).toList();
    });
    return data.map((e) => Breed.fromJson(e)).toList();
  }

  List<AnimalType> _animalType = [];
  String? _myAnimalType;

  Future<List<AnimalType>> getAnimalType() async {
    final String response = await rootBundle.rootBundle.loadString('lib/entities/sample_animal_types.json');
    final data = await json.decode(response) as List<dynamic> ;
    // var response = await http.get('https://admin.vetqyzmet.kz/api/animalTypes', headers: <String, String>{
    //   'Content-Type': 'application/json; charset=UTF-8',
    //   'Authorization' : 'Bearer $tok'
    // });
    // final data = await json.decode(response.body) as List<dynamic> ;
    setState(() {
      _animalType = data.map((e) => AnimalType.fromJson(e)).toList();
    });
    return data.map((e) => AnimalType.fromJson(e)).toList();
  }

  List<Suit> getSuitOfSelectedAnimalType(int id) {
    List<Suit> suitOfSelectedAnimalType = [];
    for (var e in _suit) {
      if (e.animal_type_id == id) suitOfSelectedAnimalType.add(e);
    }
    return suitOfSelectedAnimalType;
  }

  List<Breed> getBreedOfSelectedSuit(int id) {
    List<Breed> breedOfSelectedSuit = [];
    for (var e in _breed) {
      if (e.suit_id == id) breedOfSelectedSuit.add(e);
    }
    return breedOfSelectedSuit;
  }

  int getSuitIdByName(String name) {
    int result = 0;
    for (Suit e in _suit) {
      if (e.name == name);
    }
    return result;
  }
}

getDirection(String token) async {
  var response = await http.post('https://admin.vetqyzmet.kz/api/suit', headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization' : 'Bearer $token'
  });
  var jsonData = null;
  if (response.statusCode == 200) {
    jsonData = json.decode(response.body);
  }
  else {
    print('Not 200');
  }
}













// SingleChildScrollView(
//   child: Column(
//     children: [
//
//     ],
//   ),
// )

// Center(
//   child: Container(
//     margin: const EdgeInsets.all(16),
//     child: ListView(
//       children: [
//         Text("Выбирите тип животного", style: TextStyle(color: AppColors.GREY_COLOR),),
//         const SizedBox(height: 20,),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(11),
//               border: Border.all(color: Colors.grey, width: 2),
//             ),
//              child: DropdownButton<String>(
//                 value: valueType,
//                 iconSize: 20,
//                 items: animalType.map(buildAnimalChoise).toList(),
//                 onChanged: (valueType) => setState(() => this.valueType = valueType),
//               )
//             ),
//         const SizedBox(height: 20,),
//         const Text("Направление жиивотного", style: TextStyle(color: AppColors.GREY_COLOR),),
//         const SizedBox(height: 20,),
//         Container(
//             padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(11),
//               border: Border.all(color: Colors.grey, width: 2),
//             ),
//             child: DropdownButton<String>(
//               value: valuePurpose,
//               iconSize: 20,
//               items: animalPurpose.map(buildAnimalChoise).toList(),
//               onChanged: (valueType) => setState(() => this.valuePurpose = valuePurpose),
//             )
//         ),
//         const SizedBox(height: 20,),
//         const Text("Порода", style: TextStyle(color: AppColors.GREY_COLOR),),
//         const SizedBox(height: 20,),
//         Container(
//             padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(11),
//               border: Border.all(color: Colors.grey, width: 2),
//             ),
//             child: DropdownButton<String>(
//               value: valueBreed,
//               iconSize: 20,
//               items: animalBreed.map(buildAnimalChoise).toList(),
//               onChanged: (valueType) => setState(() => this.valueBreed = valueBreed),
//             )
//         ),
//         const SizedBox(height: 20,),
//         const Text("Введите ИНЖ", style: TextStyle(color: AppColors.GREY_COLOR),),
//         const SizedBox(height: 20,),
//         Container(
//             padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(11),
//               border: Border.all(color: Colors.grey, width: 2),
//             ),
//             child: buildIDField()
//         ),
//
//       ],
//     ),
//   ),
// ),



// }
// DropdownMenuItem<String> buildAnimalChoise(String item) =>
//     DropdownMenuItem(
//         value: item,
//         child: Text(
//           item, style: TextStyle(color: AppColors.GREY_COLOR)
//         )
//     );
//
// Widget buildIDField() => TextField(
//   controller: idController,
//   decoration: InputDecoration(
//     border: OutlineInputBorder(),
//   ),
// );
// }
// const SizedBox(height: 20,),
// FormBuilderDropdown(
//   name: "animal-breed",
//   decoration: const InputDecoration(
//     labelText: "Animal breed",
//     focusedBorder:OutlineInputBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(11),
//       ),
//       borderSide: BorderSide(color: AppColors.MAIN_COLOR),
//     ),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(11),
//       ),
//     ),
//   ),
//   allowClear: true,
//   hint: Text("Select Animal's Breed"),
//   items: animalBreed
//       .map((breed) => DropdownMenuItem(
//     value: breed,
//     child: Text('$breed'),
//   ))
//       .toList(),
// ),


// FormBuilderDropdown(
//     name: "animal-type",
//     initialValue: animalTypes.first,
//     decoration: const InputDecoration(
//       focusedBorder:OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(11),
//         ),
//         borderSide: BorderSide(color: AppColors.MAIN_COLOR),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(11),
//         ),
//       ),
//       labelText: "Animal type",
//     ),
//     allowClear: true,
//     hint: Text("Select Animal's Type"),
//     items: animalTypes
//     .map((type) => DropdownMenuItem(
//       value: type,
//       child: Text('$type'),
//     ))
//     .toList(),
// ),

// FormBuilderDropdown(
//   name: "animal-purpose",
//   decoration: const InputDecoration(
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(11),
//       ),
//       borderSide: BorderSide(color: AppColors.MAIN_COLOR),
//     ),
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.all(
//         Radius.circular(11),
//       ),
//     ),
//     labelText: "Animal purpose",
//   ),
//   allowClear: true,
//   hint: Text("Select Animal's Purpose"),
//   items: animalPurpose
//       .map((purpose) =>
//       DropdownMenuItem(
//         value: purpose,
//         child: Text('$purpose'),
//       ))
//       .toList(),
// ),