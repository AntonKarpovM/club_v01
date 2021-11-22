

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Client_creator extends StatefulWidget {
  const Client_creator({Key? key}) : super(key: key);

  @override
  _Client_creatorState createState() => _Client_creatorState();
}

class _Client_creatorState extends State<Client_creator> {

  File? image;
  DateTime selectedDate = DateTime.now();
  int year = 0;

  Future pickImage(ImageSource source) async{

 try
 {
   final image = await ImagePicker().pickImage(source: source);
   if(image==null)return;

   final imageTemporary = File(image.path);
   setState(() => this.image = imageTemporary);
 }
 on PlatformException catch (e)
 {
   print('Прблема возникла:$e');
 }
  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        year =  DateTime.fromMillisecondsSinceEpoch(DateTime.now().difference(selectedDate).inMilliseconds).year - 1970  ;
      });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MenuDrawer(),
        body:SingleChildScrollView(
          child:  Column(children: [
  Row(children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Ключ(Уникальный номер):"),
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
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Выберите дату рождения'),
              ),
            Text("${selectedDate.toLocal()}".split(' ')[0]),



            Text("ВОЗРАСТ:$year"),

            DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Column(
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

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null ? Image.file(image!,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ):FlutterLogo(size: 160,),
                Text("Выберите фото"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: ()=>pickImage(ImageSource.camera), child:Text("Камера", style: TextStyle(fontSize: 22),)),
                    ElevatedButton(onPressed: ()=>pickImage(ImageSource.gallery), child:Text("Галерея", style: TextStyle(fontSize: 22),)),

                  ],),
              ],),

            QrImage(
              data: '(0001)[89022841452]{Карпов Антон Михайлович}',
              version: QrVersions.auto,
              size: 320,
              gapless: false,
             //(на случай если захочеться добавить емблему) embeddedImage: AssetImage('assets/images/logo.png'),
              //embeddedImageStyle: QrEmbeddedImageStyle(
                //size: Size(80, 80),),
            ),

            ElevatedButton(onPressed: (){}, child:Text("Сохранить", style: TextStyle(fontSize: 22),)),
            ElevatedButton(onPressed: (){}, child:Text("Очистить", style: TextStyle(fontSize: 22),)),
          ],),
        ),
        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }

}

