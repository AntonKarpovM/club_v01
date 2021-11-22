import 'package:club_v01/page/Aboniment/Aboniment_list.dart';
import 'package:club_v01/page/Aboniment/Aboniment_creator.dart';
import 'package:flutter/material.dart';
import 'package:club_v01/page/Client/Client_list.dart';
import 'package:club_v01/page/Help.dart';
import 'package:club_v01/page/Client/Client_creator.dart';
import 'package:club_v01/page/SplashScreen.dart';
import 'package:club_v01/page/Authorization.dart';
import 'package:club_v01/page/Statet/Statistic.dart';

void main() =>runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
    ),

    initialRoute: '/SplashScreen',
    routes: {
      '/SplashScreen':(context)=> SplashScreen(nextRoute: '/Client_list'),
      '/help':(context)=> Help(),
      '/Auth':(context)=> Authorization(),
      '/Stat':(context)=> Statistic(),
      '/Client_list':(context)=> Client_list(),
      '/Abo_list':(context)=> Aboniment_list(),
      '/Client_cre':(context)=> Client_creator(),
      '/Abo_cre':(context)=> Aboniment_creator(),
    },
  ));


