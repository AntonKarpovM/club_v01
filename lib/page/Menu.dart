import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:club_v01/DataBase/DataBase.dart';


class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {


  //переменная для бд
  Data_Base Data_Base_work = Data_Base();
  List UserInfo=['Нет данных','Нет данных','Нет данных','Нет данных','Нет данных'];

  File? image;

  _MenuDrawerState() {
    GetUserInfo();
  }
  void GetUserInfo()async{
    UserInfo = await Data_Base_work.ReadID('DataApp', 'DataAppMenu');
    final imageTemporary = File(UserInfo[3]!);
    try {
      setState(() => this.image = imageTemporary);
    }
    on PlatformException catch (e){print('ERROR');}
    print(UserInfo);
  }


  @override

  Widget build(BuildContext context) {
    return
      Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.blue),
              child: UserAccountsDrawerHeader (
                decoration: BoxDecoration(color: Colors.blue.shade300),
                accountName: Text('ФИО:'+UserInfo[0].toString()),
                accountEmail: Text("Уникальны ключ:"+UserInfo[4].toString()),
                currentAccountPicture: Container(
                  child: image != null ? Image.file(image!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,
                  ):FlutterLogo(size: 160,)
                ),
              ),
            ),
            new ListTile(
                title: new Text("Посетители"),
                leading: Icon(Icons.account_box),
                onTap: (){
                  Navigator.pushNamed(context, '/Client_list');
                }
            ),

            new ListTile(
                title: new Text("Клиенты (ТЕСТОВОЕ)"),
                leading: Icon(Icons.alternate_email_rounded),
                onTap: (){
                  Navigator.pushNamed(context, '/Client_cre');
                }
            ),



            new ListTile(
                title: new Text("Абонименты редактор (ТЕСТОВОЕ)"),
                leading: Icon(Icons.alternate_email_rounded),
                onTap: (){
                  Navigator.pushNamed(context, '/Abo_cre');
                }
            ),

            new ListTile(
                title: new Text("Абонементы"),
                leading: Icon(Icons.list),
                onTap: (){
                  Navigator.pushNamed(context, '/Abo_list');
                }
            ),
            new ListTile(
                title: new Text("Помощь"),
                leading: Icon(Icons.help),
                onTap: (){
                  Navigator.pushNamed(context, '/help');
                }
            ),

            new ListTile(
                title: new Text("Окно приветсвия (ТЕСТОВОЕ)"),
                leading: Icon(Icons.alternate_email_rounded),
                onTap: (){
                  Navigator.pushNamed(context, '/SplashScreen');
                }
            ),

            new ListTile(
                title: new Text("Статистика"),
                leading: Icon(Icons.baby_changing_station),
                onTap: (){
                  Navigator.pushNamed(context, '/Stat');
                }
            ),

            new ListTile(
                title: new Text("Войти"),
                leading: Icon(Icons.assistant_photo),
                onTap: (){
                  Navigator.pushNamed(context, '/Auth');
                }
            ),

          ],
        ),
      );
  }
}
