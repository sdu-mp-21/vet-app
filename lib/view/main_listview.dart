

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vet_project/view/animal_reg.dart';
import 'package:vet_project/resourses/app_constants.dart';
import 'package:vet_project/assets/vet_icons.dart';

// import 'package:vet_project/veticons_icons.dart';

// Main content of first screen after authorization
class MainListView extends StatelessWidget {
  const MainListView(BuildContext context, {Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    double height;
    return 
    Material(
    child: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      children: <Widget>[
        const SizedBox(height: 20,),
        buildMenuItem(
          text: 'Регистрация животных',
          mainIcon: VetIcons.vet_animal_registration,
          trailingIcon: Icons.navigate_next,
          onClicked: () => selectedItem(context, 0) 
        ),
         const SizedBox(height: 20,),
        buildMenuItem(
          text: 'Услуги',
          mainIcon: Icons.medication,
          trailingIcon: Icons.navigate_next
        ),
         const SizedBox(height: 20,),
        buildMenuItem(
          text: 'Миграции',
          mainIcon: Icons.shuffle_rounded,
          trailingIcon: Icons.navigate_next
        ),
         const SizedBox(height: 20,),
        buildMenuItem(
          text: 'Справки',
          mainIcon: Icons.help_rounded,
          trailingIcon: Icons.navigate_next
        ),
      ],
    )
    );
  }
}


Widget buildMenuItem({
  required String text,
  required IconData mainIcon,
  required IconData trailingIcon,
  VoidCallback? onClicked,
}) {

    final hoverColor = Color(0xffdee2e6);
    return ListTile(
      leading: Icon(mainIcon ,color: AppColors.MAIN_COLOR,),
      title: Text(text, style: const TextStyle(color: AppColors.GREY_COLOR),
      ),
      trailing: Icon(trailingIcon, color: AppColors.GREY_COLOR),
       hoverColor: hoverColor,
       onTap:onClicked,
    );
  
}
void selectedItem(BuildContext context, int index) {
  switch(index) {
    case 0 : 
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimalRegistration()));
    break;
  }
}