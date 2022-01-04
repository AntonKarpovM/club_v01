import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:club_v01/DataBase/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:hive/hive.dart';

class Client_ReaderBuy extends StatefulWidget {
  const Client_ReaderBuy({Key? key}) : super(key: key);

  @override
  _Client_ReaderBuyState createState() => _Client_ReaderBuyState();
}

class _Client_ReaderBuyState extends State<Client_ReaderBuy> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        drawer: MenuDrawer(),
        body:SingleChildScrollView(
          child:  Column(children: [
            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ключ(Уникальный ключ):"),
                  Text("Автор:"),
                ],),
            ],),

            TextField( decoration: InputDecoration(
              labelText: 'ФИО',
              filled: true,
              fillColor: Colors.white,
            ),

            ),
            TextField( decoration: InputDecoration(
              labelText: 'Введите номер телефона домашнего',
              filled: true,
              fillColor: Colors.white,
            ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.numberWithOptions(decimal: true),

            ),

            TextField( decoration: InputDecoration(
              labelText: 'Введите номер мобильного телефона',
              filled: true,
              fillColor: Colors.white,
            ),

                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.numberWithOptions(decimal: true),

            ),

            TextField( decoration: InputDecoration(
              labelText: 'Введите адрес проживание',
              filled: true,
              fillColor: Colors.white,
            ),



            ),



            SizedBox(height: 20.0,),





            Text("ВОЗРАСТ:"),

            /*       DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Column(S
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text("Название:$value"),
                      new Text("УК:0001"),
                      new Text("Номер:1")

                    ],),
                );
              }).toList(),
              hint: Text("Выбери абонимент"),
              onChanged: (value) {print(value);},
            ),
*/


            //   QrImage(
            //  data: '0',
            //   version: QrVersions.auto,
            //   size: 320,
            //   gapless: false,
            //(на случай если захочеться добавить емблему) embeddedImage: AssetImage('assets/images/logo.png'),
            //embeddedImageStyle: QrEmbeddedImageStyle(
            //size: Size(80, 80),),
            //     ),

            ElevatedButton(onPressed: (){ }, child:Text("Сохранить", style: TextStyle(fontSize: 22),)),
            ElevatedButton(onPressed: (){}, child:Text("Очистить", style: TextStyle(fontSize: 22),)),
          ],),
        ),
        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }
}
