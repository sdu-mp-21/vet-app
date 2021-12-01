import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:vetqyzmet_flutter_week12/utils/add_spaces.dart';
import 'package:vetqyzmet_flutter_week12/utils/constans.dart';


class TextFieldAddingAnimal extends StatelessWidget {

  final String subtitle;

  const TextFieldAddingAnimal({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle, style: themeData.textTheme.subtitle1,),
          addVerticalSpace(8),
          // Container(
          //   width: size.width,
          //   height: 40,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(6),
            //   border: Border.all(color: colorGrayBorder,width: 1)
            // ),  
            // padding: const EdgeInsets.symmetric(horizontal: 12),
            Container(
              height: 42,
              child: TextField(
                cursorColor: colorBlack,
                maxLines: 1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorGrayBorder, width: 1.0,),
                    borderRadius: BorderRadius.circular(6)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: colorOrange, width: 1.0),
                    borderRadius: BorderRadius.circular(6)),
                  border: InputBorder.none,  
                  
                ),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black                  
                ),
              ),
            ),
          // ),
        ],
      ),
    );
  }
}