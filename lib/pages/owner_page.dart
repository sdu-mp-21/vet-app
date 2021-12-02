import 'package:flutter/material.dart';
import 'package:vet_project/custom/animal_count_button.dart';
import 'package:vet_project/custom/custom_appbar.dart';
import 'package:vet_project/pages/adding_animal_page.dart';
import 'package:vet_project/utils/add_spaces.dart';
import 'package:vet_project/utils/constans.dart';
import 'package:vet_project/utils/animal_count_data.dart';
import 'package:vet_project/custom/owner_page_text.dart';
//import 'package:vetqyzmet_flutter_week12/custom/animal_count_button.dart';
//import 'package:vetqyzmet_flutter_week12/custom/custom_appbar.dart';
//import 'package:vetqyzmet_flutter_week12/pages/adding_animal_page.dart';
//import 'package:vetqyzmet_flutter_week12/utils/add_spaces.dart';
//import 'package:vetqyzmet_flutter_week12/utils/constans.dart';
//import 'package:vetqyzmet_flutter_week12/custom/owner_page_text.dart';
//import 'package:vetqyzmet_flutter_week12/utils/animal_count_data.dart';

class OwnerPage extends StatefulWidget {
  const OwnerPage({Key? key}) : super(key: key);

  @override
  _OwnerPageState createState() => _OwnerPageState();
}

class _OwnerPageState extends State<OwnerPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorWhite,
        appBar: const CustomAppBar(title: 'Страница собственника'),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 84),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const OwnerPageText(
                    street: 'Ерубаева 7, 2',
                    ownerName: 'Евгений Кориенко',
                    phoneNumber: '87085776672',
                    day: 1,
                    hour: 2,
                    minut: 59,
                  ),
                  addVerticalSpace(50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'СПИСОК ЖИВОТНЫХ',
                          style: themeData.textTheme.subtitle2,
                        ),
                        addVerticalSpace(12),
                        SizedBox(
                          width: size.width,
                          height: 1,
                          child: const DecoratedBox(
                            decoration: BoxDecoration(
                              color: colorGrayBorder,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: animalCountData.length,
                      itemBuilder: (context, index) {
                        return AnimalCountButton(
                          animalData: animalCountData[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: SizedBox(
                    width: size.width,
                    height: 52,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AddingAnimalPage()));
                      },
                      color: colorOrange,
                      splashColor: colorGraySplash,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Добавить животное',
                        style: themeData.textTheme.headline2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
