import 'package:flutter/material.dart';
//import 'package:vetqyzmet_flutter_week12/utils/constans.dart';
import 'package:vet_project/utils/constans.dart';

class AnimalCountButton extends StatelessWidget {
  final dynamic animalData;

  const AnimalCountButton({Key? key, required this.animalData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final int count = animalData["count"];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            height: 48,
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () {},
              color: colorWhite,
              splashColor: colorGraySplash,
              shape: const RoundedRectangleBorder(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${animalData["animal_type"]}",
                      style: themeData.textTheme.bodyText1,
                    ),
                    Text(
                      "Всего " + count.toString(),
                      style: themeData.textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
          ),
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
    );
  }
}
