import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vetqyzmet_flutter_week12/utils/add_spaces.dart';
import 'package:vetqyzmet_flutter_week12/utils/constans.dart';


class CustonButtonAddingAnimal extends StatelessWidget {

  final String title;
  final Color colorBack;
  final Color colorText;
  final bool isWhiteButton;

  const CustonButtonAddingAnimal({
    Key? key,
    required this.title,
    required this.colorBack,
    required this.colorText,
    required this.isWhiteButton
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return Container(
      width: 167,
      height: 52,
      child: FlatButton(
        onPressed: (){},
        color: colorBack,
        splashColor: colorGraySplash,
        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(
                    color: isWhiteButton? colorGrayBorder : colorOrange,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
        child: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: colorText),
          ),
      ),
    );
  }
}