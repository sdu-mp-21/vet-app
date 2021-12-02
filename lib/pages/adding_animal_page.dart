import 'package:flutter/material.dart';
import 'package:vet_project/custom/borderbox_adding_animal.dart';
import 'package:vet_project/custom/custom_appbar.dart';
import 'package:vet_project/custom/custom_button_adding_animal.dart';
import 'package:vet_project/custom/text_field_adding_animal.dart';
import 'package:vet_project/utils/add_spaces.dart';
import 'package:vet_project/utils/constans.dart';



class AddingAnimalPage extends StatelessWidget {
  const AddingAnimalPage({ Key? key }) : super(key: key);
  static const String routeName = "/owner_adding_animal_page1";


  @override
  Widget build(BuildContext context) {
    int _value = 1;
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);

    return  SafeArea(
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: const CustomAppBar(title: 'Добавить животное'),
        body: 
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                children: [
                  addVerticalSpace(20),
                  const BorderBoxAddingAnimal(title: 'Крупной рогатый скот', subtitle: 'Выберите тип животного',
                    icon: Icons.keyboard_arrow_down,),
                  addVerticalSpace(16),
                  const BorderBoxAddingAnimal(title: 'Молочно-мясной', subtitle: 'Направление животного',
                    icon: Icons.keyboard_arrow_down,),
                  addVerticalSpace(16),
                  const BorderBoxAddingAnimal(title: 'Ангус', subtitle: 'Порода',
                    icon: Icons.keyboard_arrow_down),
                  addVerticalSpace(16),
                  const TextFieldAddingAnimal(subtitle: 'Введите ИНЖ',),
                  addVerticalSpace(16),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Пол коровы', style: themeData.textTheme.subtitle1,),
                          addVerticalSpace(8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                                
                                children: [
                                  Radio(value: 1, groupValue: 1, onChanged: (value){},activeColor: colorOrange,),
                                  addHorizontalSpace(5),
                                  Text(
                                    'Caмка',
                                    style: themeData.textTheme.bodyText1),
                                ],
                              ),
                                  addHorizontalSpace(10),
                              Row(
                                children: [
                                  Radio(value: 2, groupValue: 2, onChanged: (value){},activeColor: colorOrange,),
                                  addHorizontalSpace(10),
                                  Text(
                                    'Caмец',
                                    style: themeData.textTheme.bodyText1),
                                ],
                              ),
                            ],
                          ),
                          // Container(
                          //   width: size.width,
                          //   height: 40,
                            
                          // ),
                        ],
                      ),
                    ),
                  ),
                  addVerticalSpace(16),
                  const BorderBoxAddingAnimal(title: '2021, август', subtitle: 'Дата рождения', icon: Icons.date_range),
                 
                  addVerticalSpace(160),

                 Flexible(
                   flex: 1,
                   child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              CustonButtonAddingAnimal(
                                title: 'Отмена',
                                colorBack: colorWhite,
                                colorText: colorBlack,
                                isWhiteButton: true,
                                ),
                              CustonButtonAddingAnimal(
                                title: 'Далее',
                                colorBack: colorOrange,
                                colorText: colorWhite,
                                isWhiteButton: false,
                              ),
                            ],
                    ),
                        
                      ),
                 )
                ],
          ),
              ),
            
          // Positioned(
          //       bottom: 16,
          //       width: size.width,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: const [
          //               CustonButtonAddingAnimal(
          //                 title: 'Отмена',
          //                 colorBack: colorWhite,
          //                 colorText: colorBlack,
          //                 isWhiteButton: true,
          //                 ),
          //               CustonButtonAddingAnimal(
          //                 title: 'Далее',
          //                 colorBack: colorOrange,
          //                 colorText: colorWhite,
          //                 isWhiteButton: false,
          //               ),
          //             ],
          //     ),
                  
          //       )),
          
        
      ),
    );
  }
}

