import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';

class Aboniment_creator extends StatefulWidget {
  const Aboniment_creator({Key? key}) : super(key: key);

  @override
  _Aboniment_creatorState createState() => _Aboniment_creatorState();
}

class _Aboniment_creatorState extends State<Aboniment_creator> {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
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
            labelText: 'Введите уникальный номер для абонимента',
            filled: true,
            fillColor: Colors.white,
          ),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          TextField( decoration: InputDecoration(
            labelText: 'Введите название',
            filled: true,
            fillColor: Colors.white,
          ),
          ),

          TextField( decoration: InputDecoration(
            labelText: 'Введите количество занятий',
            filled: true,
            fillColor: Colors.white,
          ),

            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.numberWithOptions(decimal: true),

          ),

          TextField( decoration: InputDecoration(
            labelText: 'Введите количество дней',
            filled: true,
            fillColor: Colors.white,
          ),

            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.numberWithOptions(decimal: true),

          ),

          TextField( decoration: InputDecoration(
            labelText: 'Введите стоимость абонимента',
            filled: true,
            fillColor: Colors.white,

          ),


            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
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

