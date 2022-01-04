import 'package:club_v01/page/Aboniment/Aboniment_list.dart';
import 'package:club_v01/page/Aboniment/Aboniment_creator.dart';
import 'package:flutter/material.dart';
import 'package:club_v01/page/Client/Client_list.dart';
import 'package:club_v01/page/Client/Client_ReaderBuy.dart';
import 'package:club_v01/page/Help.dart';
import 'package:club_v01/page/Client/Client_creator.dart';
import 'package:club_v01/page/SplashScreen.dart';
import 'package:club_v01/page/Authorization.dart';
import 'package:club_v01/page/Statet/Statistic.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:club_v01/DataBase/DataBase.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(AbonimentAdapter());
  Hive.registerAdapter(ClientAdapter());

  print("Hive инициализирован!");
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
    ),

    initialRoute: '/SplashScreen',
    routes: {
      '/SplashScreen':(context)=> SplashScreen(nextRoute: '/Auth'),
      '/help':(context)=> Help(),
      '/Client_Read':(context)=> Client_ReaderBuy(),
      '/Auth':(context)=> Authorization(),
      '/Stat':(context)=> Statistic(),
      '/Client_list':(context)=> Client_list(),
      '/Abo_list':(context)=> Aboniment_list(),
      '/Client_cre':(context)=> Client_creator(),
      '/Abo_cre':(context)=> Aboniment_creator(),
    },
  ));
}


