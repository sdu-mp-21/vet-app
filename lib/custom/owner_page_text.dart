import 'package:flutter/material.dart';
import 'package:vetqyzmet_flutter_week12/utils/add_spaces.dart';
import 'package:vetqyzmet_flutter_week12/utils/constans.dart';

class OwnerPageText extends StatelessWidget {
  final String street;
  final String ownerName;
  final String phoneNumber;
  final int day;
  final int hour;
  final int minut;

  const OwnerPageText({
    Key? key,
    required this.street,
    required this.ownerName,
    required this.phoneNumber,
    required this.day,
    required this.hour,
    required this.minut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            addVerticalSpace(23.5),
            Text(street, style: themeData.textTheme.bodyText1),
            addVerticalSpace(4),
            Text(ownerName, style: themeData.textTheme.bodyText2),
            addVerticalSpace(4),
            Text(phoneNumber, style: themeData.textTheme.bodyText2),
            addVerticalSpace(12),
            SizedBox(
              width: size.width,
              height: 48,
              // ignore: deprecated_member_use
              child: FlatButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actionsPadding:
                            const EdgeInsets.only(bottom: 8, right: 8),
                        backgroundColor: colorWhite,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: Text(
                          'Завершение задании',
                          style: themeData.textTheme.headline1,
                        ),
                        content: Text(
                          'Если завершить задание возможность регистрации животных закроется',
                          style: themeData.textTheme.subtitle1,
                        ),
                        actions: [
                          SizedBox(
                            width: 108,
                            height: 36,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () {},
                              color: colorGraySplash,
                              splashColor: colorGrayText,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Завершить',
                                style: themeData.textTheme.headline3,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 84,
                            height: 36,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: colorOrange,
                              splashColor: colorGrayText,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'Отмена',
                                style: themeData.textTheme.headline2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  color: colorWhite,
                  splashColor: colorGraySplash,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(
                    color: colorOrange,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
                  child: Column(
                    children: [
                      addVerticalSpace(2),
                      Text('Задание запущено',
                          style: themeData.textTheme.subtitle1),
                      addVerticalSpace(4),
                      Text(
                        day.toString() +
                            ' дня и ' +
                            hour.toString() +
                            ' часов ' +
                            minut.toString() +
                            ' мунут назад',
                        style: themeData.textTheme.bodyText1,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
