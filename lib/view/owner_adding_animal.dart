import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../app_constants.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AnimalAdding extends StatefulWidget {

  static const String routeName = "/owner_adding_animal_page";

  AnimalAdding({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _AnimalAdding();


}

class _AnimalAdding extends State<AnimalAdding> {

  final _formKey = GlobalKey<FormBuilderState>();


  final List<String> animalTypes = ["Cow", "Camel", "Sheep"];
  final List<String> animalPurpose = ["milk", "meat", "milk and meat"];
  final List<String> cowBreed = ["Angus", "Abergele", "Brown Carpathian" ,"Kurgan cattle"];
  final List<String> sheepBreed = ["Lincoln sheep", "Edilbayevskaya", "Akzhaiyskaya"];
  final List<String> camelBreed = ["Baktrian", "Aruana", "Dromedar"];
  String? selectedType;
  String? selectedBreed;
  List<String> breed = [];

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
                  // Text("Выбирите пароду", style: TextStyle(color: Colors.grey[350]),),
                  // const SizedBox(height: 20,),
                  DropdownButton<String>(
                    isExpanded: true,
                    value: selectedType,
                    items: animalTypes.map((e) {
                      return DropdownMenuItem<String>(
                          value: e,
                          child: Text('$e')
                      );
                    }).toList(),
                    onChanged: (val) {
                      selectedBreed = null;
                      if (val == "Cow") breed = cowBreed;
                      if (val == "Sheep") breed = sheepBreed;
                      if (val == "Camel") breed = camelBreed;
                      setState(() {
                        selectedType = val;
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
                    value: selectedBreed,
                    items: breed.map((e) {
                      return DropdownMenuItem<String>(
                          value: e,
                          child: Text('$e')
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
                        "Select Animal's Breed",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  FormBuilderDropdown(
                    name: "animal-purpose",
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                        borderSide: BorderSide(color: AppColors.MAIN_COLOR),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(11),
                        ),
                      ),
                      labelText: "Animal purpose",
                    ),
                    allowClear: true,
                    hint: Text("Select Animal's Purpose"),
                    items: animalPurpose
                        .map((purpose) =>
                        DropdownMenuItem(
                          value: purpose,
                          child: Text('$purpose'),
                        ))
                        .toList(),
                  ),
                  const SizedBox(height: 20,),
                  FormBuilderTextField(
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }}













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