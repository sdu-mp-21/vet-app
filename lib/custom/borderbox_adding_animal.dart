import 'package:flutter/material.dart';
import 'package:vet_project/utils/add_spaces.dart';
import 'package:vet_project/utils/constans.dart';



class BorderBoxAddingAnimal extends StatelessWidget {

  final String title;
  final String subtitle;
  final IconData icon;

  const BorderBoxAddingAnimal({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle, style: themeData.textTheme.subtitle1,),
            addVerticalSpace(8),
            Container(
              width: size.width,
              height: 40,
              child: FlatButton(
                onPressed: (){},
                color: colorWhite,
                splashColor: colorGraySplash,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(
                    color: colorGrayBorder,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: themeData.textTheme.bodyText1,),
                    Icon(icon,color: colorGrayText,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}