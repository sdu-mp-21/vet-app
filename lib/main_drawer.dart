import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'app_constants.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.MAIN_COLOR,
              ),
              child: Column(children: [
                   Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                    fit: BoxFit.fill,
                   image: AssetImage('assets/img/default_user.png'),
              ),
            ),
          ),
          const Text(
            "Username",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "user@example.com",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
              ],)
            ),
            const SizedBox(height: 20,),
             ListTile(
              leading: const Icon(Icons.mail_outline_outlined, color: AppColors.MAIN_COLOR,),
              title: const Text('Сообщения', style: TextStyle(color: AppColors.GREY_COLOR, fontSize: 14),),
               onTap: () {},
            ),
            const SizedBox(height: 20,),
            ListTile(
              leading: const Icon(Icons.history_sharp, color: AppColors.MAIN_COLOR,),
              title: const Text('История', style: TextStyle(color: AppColors.GREY_COLOR, fontSize: 14),),
               onTap: () {},
            ),
            const SizedBox(height: 20,),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: AppColors.MAIN_COLOR,),
              title: const Text('Календарь', style: TextStyle(color: AppColors.GREY_COLOR, fontSize: 14),),
               onTap: () {},
            ),
            const SizedBox(height: 24,),
            Divider(color: Colors.grey[250]),
            const SizedBox(height: 24,),
            ListTile(
              leading: const Icon(Icons.settings, color: AppColors.MAIN_COLOR,),
              title: const Text('Настройки', style: TextStyle(color: AppColors.GREY_COLOR, fontSize: 14),),
               onTap: () {},
            ),
          ],
        ),
      );
  }
}