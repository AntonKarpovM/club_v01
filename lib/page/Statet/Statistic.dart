

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;



class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {

  File? image;
  DateTime selectedDate = DateTime.now();
  int year = 0;











  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MenuDrawer(),
        body:SingleChildScrollView(
          child:  Column(children: [
          Text('Статистика БД:'),
            Table(
              children: [
                TableRow(children:[
                  Text("Данные1"),
                ],
                ),
              ],
            ),
            Text('Список пользователей:'),
            Text('Список Абониментов:'),
            Text('Список Клиентов:'),

           ],),
        ),
        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }

}

