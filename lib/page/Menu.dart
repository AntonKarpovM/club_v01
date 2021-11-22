import 'package:flutter/material.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
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
                accountName: Text('ФИО:'),
                accountEmail: Text("Уникальны ключ:"),
                currentAccountPicture: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.red,
                    )
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
