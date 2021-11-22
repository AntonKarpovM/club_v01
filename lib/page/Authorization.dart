

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {

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
                  Text("Количество пользователей:"),
                ],),
            ],),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null ? Image.file(image!,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ):FlutterLogo(size: 160,),
                Text("Выберите фото(пожеланию)"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: ()=>pickImage(ImageSource.camera), child:Text("Камера", style: TextStyle(fontSize: 22),)),
                    ElevatedButton(onPressed: ()=>pickImage(ImageSource.gallery), child:Text("Галерея", style: TextStyle(fontSize: 22),)),

                  ],),
              ],),


            TextField( decoration: InputDecoration(
              labelText: 'Логин',
              filled: true,
              fillColor: Colors.white,
            ),

            ),
            TextField( decoration: InputDecoration(
              labelText: 'Пароль',
              filled: true,
              fillColor: Colors.white,
            ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),






            ElevatedButton(onPressed: (){}, child:Text("Войти", style: TextStyle(fontSize: 22),)),
            ElevatedButton(onPressed: (){}, child:Text("Создать", style: TextStyle(fontSize: 22),)),
            ElevatedButton(onPressed: (){}, child:Text("Очистить", style: TextStyle(fontSize: 22),)),
          ],),
        ),
        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }

}

