import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';



class Aboniment_list extends StatefulWidget {
  const Aboniment_list({Key? key}) : super(key: key);




  @override
  State<Aboniment_list> createState() => _Aboniment_listState();
}

class _Aboniment_listState extends State<Aboniment_list> {

  List PepoleList = [];








  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    PepoleList.addAll([
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
      'Сергей',
      'Николай',
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        drawer: MenuDrawer(),
        body:
        Column(children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white,

            ),
            style: TextStyle(fontSize: 22,color: Colors.black),
            maxLines: 1,
          ),
          Expanded(child:  ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

              itemCount: PepoleList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(

                  height: 150,
                  color: Colors.white,
                  margin: EdgeInsets.all(2),

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Название абонимента:'+PepoleList[index]),
                          Text('Количество дней:'+PepoleList[index]),
                          Text('Количество занятий:'+PepoleList[index]),
                          Text('Стоимость:'+PepoleList[index]),
                        ],

                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Ключ:'+PepoleList[index]),
                          Text('Номер:'+PepoleList[index]),
                        ],

                      ),


                    ],
                  ),

                );
              }),)
        ]),


        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }
}
