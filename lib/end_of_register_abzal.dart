import 'package:flutter/material.dart';


class EndOfRegister extends StatefulWidget {
  const EndOfRegister({ Key? key }) : super(key: key);

  @override
  _EndOfRegisterState createState() => _EndOfRegisterState();
  
}

class _EndOfRegisterState extends State<EndOfRegister> {
  String street = "Ерубаева 7, 2";
  String name = "Евгений Кориенко";
  String phone = "87085776672";
  String zad_zap = "Задание запущено";
  String time = "2 дня и 6 часов 1 мунут назад";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          leading: 
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
            iconSize: 24,
            splashRadius: 24,
          ),
          title: const Text(
            "Завершение регестрации",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Roboto500',
              color: Colors.black,
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: const Color(0xFFDCE0E5),
              height: 1,
            ), 
            preferredSize: const Size.fromHeight(1)
          ),
        )
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 24)),
            Text(
              "Тип животного",
              style: const TextStyle(
                fontSize: 14, 
                color: Color(0xFF5D6978),
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 4,),
            Text(
              "Корова",
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black,
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),
           

            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Text(
              "Направление животного",
              style: const TextStyle(
                fontSize: 14, 
                color: Color(0xFF5D6978),
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 4,),
            Text(
              "Молочный",
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black,
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Text(
              "Порода",
              style: const TextStyle(
                fontSize: 14, 
                color: Color(0xFF5D6978),
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 4,),
            Text(
              "Казахская белоголовая",
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black,
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Text(
              "Пол",
              style: const TextStyle(
                fontSize: 14, 
                color: Color(0xFF5D6978),
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 4,),
            Text(
              "Самка",
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black,
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Text(
              "ИНЖ",
              style: const TextStyle(
                fontSize: 14, 
                color: Color(0xFF5D6978),
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 4,),
            Text(
              "9502394823",
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black,
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),

            const Padding(padding: EdgeInsets.only(bottom: 16)),
            Text(
              "Дата рождения",
              style: const TextStyle(
                fontSize: 14, 
                color: Color(0xFF5D6978),
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 4,),
            Text(
              "2021, август",
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black,
                fontFamily: "Roboto400",
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 300,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: (){}, 
                  child: const Text('Заполнить заново',
                  style: TextStyle(color: Colors.black),),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(Size(168,52)),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF7800)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)
                      )
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(Size(168,52)),
                  ),
                  onPressed: (){}, 
                  child: Text('Завершить',
                  style: TextStyle(color: Colors.white),),
                )
              ],
            )
          ],
        ),
        
      ),

      

      // body: SafeArea(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Column(
      //         children: [
      //           const SizedBox(height: 24),
      //           Column(
      //             children: [
      //               Text(
      //                 street,
      //                 style: const TextStyle(
      //                   fontSize: 16, 
      //                   color: Colors.black,
      //                   fontFamily: "Roboto400",
      //                   fontWeight: FontWeight.w400
      //                 ),
      //               ),
      //               const Padding(padding: EdgeInsets.only(bottom: 4)),
      //               Text(
      //                 name,
      //                 style: const TextStyle(
      //                   fontSize: 16, 
      //                   color: Color(0xFFFF7800),
      //                   fontFamily: "Roboto400",
      //                   fontWeight: FontWeight.w400
      //                 ),
      //               ),
      //               const Padding(padding: EdgeInsets.only(bottom: 4)),
      //               Text(
      //                 phone,
      //                 style: const TextStyle(
      //                   fontSize: 16, 
      //                   color: Color(0xFFFF7800),
      //                   fontFamily: "Roboto400",
      //                   fontWeight: FontWeight.w400
      //                 ),
      //               ),
      //             ],
      //           ),
      //           const Padding(padding: EdgeInsets.only(bottom: 12)),
      //           Container(
      //             height: 42,
      //             child: Column(
      //               children: [
      //                 Text(
      //                   zad_zap,
      //                   style: const TextStyle(
      //                     fontSize: 14, 
      //                     color: Color(0xFF5D6978),
      //                     fontFamily: "Roboto400",
      //                     fontWeight: FontWeight.w400
      //                   ),
      //                 ),
      //                 const Padding(padding: EdgeInsets.only(bottom: 4)),
      //                 Text(
      //                   time,
      //                   style: const TextStyle(
      //                     fontSize: 16, 
      //                     color: Colors.black,
      //                     fontFamily: "Roboto400",
      //                     fontWeight: FontWeight.w400
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),

                
      //           Row(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 "зарегестрировано",
      //                 style: TextStyle(
      //                 fontSize: 12,
      //                 fontFamily: "Roboto400",
      //                 color: Color(0xFF5D6978),
      //               ),
      //             ),
      //           ]),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
