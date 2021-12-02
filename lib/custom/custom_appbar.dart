// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:vet_project/utils/constans.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
 
  final String title;

  const CustomAppBar({
    Key? key,
     required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: AppBar(
        backgroundColor: colorWhite,
        elevation: 0,

        leading: 
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.arrow_back),
          color: colorBlack,
          iconSize: 24,
          splashRadius: 24,
        ),
        title: Text(
          title,
          style: themeData.textTheme.headline1,
        ),
        bottom: PreferredSize(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: colorGrayBorder,
            height: 1,
          ), 
          preferredSize: const Size.fromHeight(1)
        ),
      )
    );
  }
}