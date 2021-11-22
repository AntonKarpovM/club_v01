import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class Client_list extends StatefulWidget {
  const Client_list({Key? key}) : super(key: key);




  @override
  State<Client_list> createState() => _Client_listState();
}

class _Client_listState extends State<Client_list> {

  List PepoleList = [];
Future _qrScaner() async{
  try {
    String qrResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.DEFAULT);
    print(qrResult);
  }
  on PlatformException catch (e)
  {
    print('Прблема возникла:$e');
  }
}







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
             Row(children: [
               ElevatedButton(onPressed: ()=>_qrScaner(), child:Text("QR поиск", style: TextStyle(fontSize: 22),)),
               ElevatedButton(onPressed: (){}, child:Text("QR группа", style: TextStyle(fontSize: 22),)),
               ElevatedButton(onPressed: (){}, child:Text("Сброс", style: TextStyle(fontSize: 22),)),
             ],),
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

                                Text('ФИО:'+PepoleList[index]),
                                Text('Дата Рождения:'+PepoleList[index]),
                                Text('Телефон:'+PepoleList[index]),
                                Text('Возраст:'+PepoleList[index]),
                                Text('Абонемент:'+PepoleList[index]),
                                Text('Статус:'+PepoleList[index]),
                                Text("Автор:"),
                                Text("Дата создания:"),
                              ],

                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text('ФОТО'),
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
