import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';
class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        drawer: MenuDrawer(),
        body: Container(child: Center(child: Text('Нету помощи!!'),),),
        appBar: AppBar(
    title: Text('CLUB POLE DANCE'),
    centerTitle: true,
    ));
  }
}