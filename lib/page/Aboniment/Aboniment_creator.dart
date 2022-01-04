import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';
import 'package:club_v01/DataBase/DataBase.dart';
import 'package:hive/hive.dart';

class Aboniment_creator extends StatefulWidget {
  const Aboniment_creator({Key? key}) : super(key: key);

  @override
  _Aboniment_creatorState createState() => _Aboniment_creatorState();
}

class _Aboniment_creatorState extends State<Aboniment_creator> {



  Data_Base Data_Base_work = Data_Base();
  List UserInfo=['Нет данных','Нет данных','Нет данных','Нет данных','Нет данных'];

  _Aboniment_creatorState(){
    GetUserInfo();

  }

  void GetUserInfo()async{
    UserInfo = await Data_Base_work.ReadID('DataApp', 'DataAppMenu');
    setState(() {});
    print(UserInfo);
  }

  ///ДАнные к заполнениею обязаловка

  int? _NumberAbo;//to int ввод

  String? _NameAbo;//ввод

  DateTime? _DateCreate;//автоматический ввод

  int? _KolVoZan;//to int ввод

  int? _KolVoDay;//to int ввод

  double? _Price;//to bool ввод

  User? _Author;//автоматический ввод

_ChangeNumberAbo(String Text){
  try{_NumberAbo = int.parse(Text); print("я преобразовал($_NumberAbo)");}
  catch(e){Toast("Ввод данных только цыфры без плавущих точек[.]");print("Ввод данных только цыфры без плавущих точек[.]");}
}

  _ChangeNameAbo(String Text){
    try{_NameAbo = Text;}
    catch(e){Toast("ХМ ЭТО ВПРИНЦИПЕ НЕВОЗМОЖНО(NOT BAD)");print("ХМ ЭТО ВПРИНЦИПЕ НЕВОЗМОЖНО(NOT BAD)");}
  }


  _ChangeKolVoZan(String Text){
    try{_KolVoZan = int.parse(Text);print("я преобразовал($_KolVoZan)");}
    catch(e){Toast("Ввод данных только цыфры без плавущих точек[.]");print("Ввод данных только цыфры без плавущих точек[.]");}
  }

  _ChangeKolVoDay(String Text){
    try{_KolVoDay = int.parse(Text);print("я преобразовал($_KolVoDay)");}
    catch(e){Toast("Ввод данных только цыфры без плавущих точек[.]");print("Ввод данных только цыфры без плавущих точек[.]");}
  }

  _ChangePrice(String Text){
    try{_Price = double.parse(Text);print("я преобразовал($_Price)");}
    catch(e){Toast("Ввод данных c копейками[99.99 или 99.00] нарисуй копейки");print("Ввод данных c копейками[99.99 или 99.00] нарисуй копейки");}
  }


  ProvAuth() {
    bool _prov = true;
    if(_NumberAbo==0 || _NumberAbo == null){Toast("Запоните Номер абонимета!");print('Запоните Номер абонимета!значение($_NumberAbo)');_prov = false;}
    if(_NameAbo=="" || _NameAbo == null){Toast("Запоните Имя абонимета!");print('Запоните Имя абонимета!значение($_NameAbo)');_prov = false;}
    if(_KolVoZan==0 || _KolVoZan == null){Toast("Запоните КолВо занятий абонимета!");print('Запоните КолВо занятий абонимета!значение($_KolVoZan)');_prov = false;}
    if(_KolVoDay==0 || _KolVoDay == null){Toast("Запоните КолВо дней занятий абонимета!");print('Запоните КолВо дней занятий абонимета!значение($_KolVoDay)');_prov = false;}
    if(_Price ==0.0 || _Price  == null){Toast("Запоните цену абонимета!");print('Запоните цену абонимета!значение($_Price)');_prov = false;}


    return _prov;
  }


  void CreateAboniment()async{
    if(ProvAuth()){
        var UserBox = await Hive.openBox('TestBox');
        User UserNeed = await Data_Base_work.ReadID('TestBox', UserInfo[4]);
        HiveList<User> SearchUser = HiveList(UserBox,objects: [UserNeed]);
        var AbonimentWrite = Aboniment(_NumberAbo!, _NameAbo!, DateTime.now(), _KolVoZan!, _KolVoDay!, _Price!, SearchUser );
        Data_Base_work.Write( AbonimentWrite, 'TestBoxAboniment');
        print('Записал');
        Toast("Записал");
        
    }
    else{
      print("Не записал");
      Toast("Не записал");
    }
  }
  
  

  void Toast(String Message){
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text(Message),duration: Duration(seconds: 1),));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          child:  Column(children: [

            Row(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ключ(Уникальный ключ):"+UserInfo[4].toString()),
                  Text("Автор:"+UserInfo[0]),
                ],),
            ],),

            TextField( decoration: InputDecoration(
            labelText: 'Введите уникальный номер для абонимента',
            filled: true,
            fillColor: Colors.white,
          ),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: _ChangeNumberAbo
          ),
          TextField( decoration: InputDecoration(
            labelText: 'Введите название',
            filled: true,
            fillColor: Colors.white,
          ),
              onChanged: _ChangeNameAbo
          ),

          TextField( decoration: InputDecoration(
            labelText: 'Введите количество занятий',
            filled: true,
            fillColor: Colors.white,
          ),

            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: _ChangeKolVoZan
          ),

          TextField( decoration: InputDecoration(
            labelText: 'Введите количество дней',
            filled: true,
            fillColor: Colors.white,
          ),

            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: _ChangeKolVoDay
          ),

          TextField( decoration: InputDecoration(
            labelText: 'Введите стоимость абонимента',
            filled: true,
            fillColor: Colors.white,

          ),


            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: _ChangePrice
          ),

          ElevatedButton(onPressed: (){CreateAboniment();}, child:Text("Сохранить", style: TextStyle(fontSize: 22),)),
          ElevatedButton(onPressed: (){}, child:Text("Очистить", style: TextStyle(fontSize: 22),)),
        ],),
        ),
        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }

}

