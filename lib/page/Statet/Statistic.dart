

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

  DateTime selectedDateEnd = DateTime.now();

  DateTime selectedDateStart = DateTime.now();

  String NameTable = "НЕ ВЫБРАНА";

  List<List<dynamic>> data = [];



void selectDate(BuildContext context,But)async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day));
    if (picked != null && picked != selectedDate) {
      setState(() {

        if(But == 1)
        {

          if(picked.millisecondsSinceEpoch >= selectedDateStart.millisecondsSinceEpoch)
            {
              selectedDateEnd = picked;
            }
          else
            {
              selectedDateEnd= DateTime.now();
              print("Ошибка");
            }
        }
        else
        {
          selectedDateEnd = picked;
        }
      });
    }

  }

  void StatBd() async{

  }

  void ListAcount() async {

  }

  void ListClient()async{

  }

  void ListAboniment()async{

  }



  void loadAsset() async {
    final myData = await rootBundle.loadString("csvTable/testRead.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    data = csvTable;

  }









  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MenuDrawer(),
        body:SingleChildScrollView(
          child:  Column(children: [

          Container(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text('Выберите времменой промежуток для таблиц:'),
                    Row(children: [

                       Text('Дата с'),
                         ElevatedButton(
                             onPressed: (){ selectDate(context,0);},
                              child: Text("${selectedDateStart.toLocal()}".split(' ')[0]),
                         ),
                       Text('Дата до'),
                       ElevatedButton(
                          onPressed: () {selectDate(context,1);},
                          child: Text("${selectedDateEnd.toLocal()}".split(' ')[0]),
                        ),

                    ],),

                  Text("Выбери желаемую таблицу:"),

                  ElevatedButton(onPressed: () async {

                    NameTable = "Статистика БД";

                    data.clear();
                    data.add(["Размер бд(мб):",132]);
                    data.add(["Кол-во акк:",132]);
                    data.add(["Кол-во клиентов:",132]);
                    data.add(["Кол-во абониментов:",132]);
                    data.add(["последние внесение в бд:",132]);
                    data.add(["Послдняя выгрузка бд:",132]);

                    setState(() {

                    });
                    print(data);
                  }, child:Text("Статистика БД", style: TextStyle(fontSize: 17),)),

                  ElevatedButton(onPressed: () async {

                    NameTable = "Список пользователей";

                    data.clear();
                    data.add(["Размер бд(мб):",132]);
                    data.add(["Кол-во акк:",132]);
                    data.add(["Кол-во клиентов:",132]);
                    data.add(["Кол-во абониментов:",132]);
                    data.add(["последние внесение в бд:",132]);
                    data.add(["Послдняя выгрузка бд:",132]);

                    setState(() {

                    });
                    print(data);
                  }, child:Text("Список пользователей", style: TextStyle(fontSize: 17),)),

                  ElevatedButton(onPressed: () async {

                    NameTable = "Список клиентов";

                    data.clear();
                    data.add(["Размер бд(мб):",132]);
                    data.add(["Кол-во акк:",132]);
                    data.add(["Кол-во клиентов:",132]);
                    data.add(["Кол-во абониментов:",132]);
                    data.add(["последние внесение в бд:",132]);
                    data.add(["Послдняя выгрузка бд:",132]);

                    setState(() {

                    });
                    print(data);
                  }, child:Text("Список клиентов", style: TextStyle(fontSize: 17),)),

                  ElevatedButton(onPressed: () async {

                    NameTable = "Список абониментов";

                    data.clear();
                    data.add(["Размер бд(мб):",132]);
                    data.add(["Кол-во акк:",132]);
                    data.add(["Кол-во клиентов:",132]);
                    data.add(["Кол-во абониментов:",132]);
                    data.add(["последние внесение в бд:",132]);
                    data.add(["Послдняя выгрузка бд:",132]);

                    setState(() {

                    });
                    print(data);
                  }, child:Text("Список абониментов", style: TextStyle(fontSize: 17),)),

                  Text("Выполнить дествие:"),
                  Row(children: [

                    ElevatedButton(onPressed: () async {
                      setState(() {});
                      print(data);
                    }, child:Text("Эксп БД", style: TextStyle(fontSize: 17),)),

                    ElevatedButton(onPressed: () async {
                      setState(() {});
                      print(data);
                    }, child:Text("Эксп Табл", style: TextStyle(fontSize: 17),)),

                    ElevatedButton(onPressed: () async {
                      setState(() {});
                      print(data);
                    }, child:Text("Импорт БД", style: TextStyle(fontSize: 17),)),
                  ],),
                ],),



          ),

            Text("ТАБЛИЦА($NameTable)"),
            Table(

            border: TableBorder.all(width: 1.0),
            children: data.map((item) {
              return TableRow(
                  children: item.map((row) {
                    return Container(
                      color:
                      row.toString().contains("NA") ? Colors.red : Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          row.toString(),
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ),
                    );
                  }).toList());
            }).toList(),
          ),


           ],),
        ),
        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }

}

