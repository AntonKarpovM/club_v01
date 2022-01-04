import 'dart:io';


import 'package:club_v01/DataBase/DataBase.dart';
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


  Data_Base Data_Base_work = Data_Base();
  var PepoleList;
  int KolPepole = 0;
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

void GetPepoleList()async{
 var box= await Data_Base_work.Read_and_get_box("TestBoxClient");

  setState((){
    PepoleList = box;
    KolPepole =  PepoleList.length;
    print(PepoleList);
  });

}


  @override
  void initState() {
    // TODO: implement initState
    GetPepoleList();
    super.initState();




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

                    itemCount: KolPepole,
                    itemExtent: 190,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                        child: Stack(
                          children: [Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),

                          clipBehavior: Clip.hardEdge,// обрезает все что находиться за пределами контейнера

                          child: GestureDetector(

                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Container(

                                        child: PepoleList.getAt(index)?.ImagePath != null ? Image.file(File(PepoleList.getAt(index).ImagePath),
                                          width: 140,
                                          height: 170,
                                          fit: BoxFit.cover,
                                        ):FlutterLogo(size: 140,)
                                    ),
                                  ],

                                ),
                              Expanded(
                                  child:  Column(

                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('ФИО:'),
                                      Text('('+PepoleList.getAt(index).NameClient+')',maxLines: 1,overflow: TextOverflow.ellipsis),
                       //               Text('Дата Рождения:'+PepoleList[index][1].toString(),maxLines: 1,overflow: TextOverflow.ellipsis),
                                      Text('Телефон(мобильный):'),
                                      Text('('+PepoleList.getAt(index).NumberPhone.toString()+')',maxLines: 1,overflow: TextOverflow.ellipsis),
                                      Text('Телефон(домашний):'),
                                      Text('('+PepoleList.getAt(index).NumberPhoneHome.toString()+')',maxLines: 1,overflow: TextOverflow.ellipsis),
                                      Text('Адрес:'),
                                      Text('('+PepoleList.getAt(index).Adress.toString()+')',maxLines: 1,overflow: TextOverflow.ellipsis),
                                      //            Text('Возраст:'+PepoleList[index][3].toString(),maxLines: 1,overflow: TextOverflow.ellipsis),
                                      Text("Автор:(ID["+PepoleList.getAt(index).Author[0].key.toString()+']):(Имя['+PepoleList.getAt(index).Author[0].Login+'])',maxLines: 1,overflow: TextOverflow.ellipsis),
                                        Text("ID:"+PepoleList.getAt(index).key.toString(),maxLines: 1,overflow: TextOverflow.ellipsis),

                                    ],

                                  ),
                              ),

                              ],
                            ) ,
                          ),

                        ),
                            Material(

                              color:Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                onTap: (){
                                  print(index);
                                  Navigator.pushNamed(context, '/Client_Read');
                                  },
                            ),),
                          ],)
                      );
                    }),)
            ]),


        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }
}
