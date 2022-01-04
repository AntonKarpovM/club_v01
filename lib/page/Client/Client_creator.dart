
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:club_v01/DataBase/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:club_v01/page/Menu.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:hive/hive.dart';

class Client_creator extends StatefulWidget {
  const Client_creator({Key? key}) : super(key: key);

  @override
  _Client_creatorState createState() => _Client_creatorState();
}

class _Client_creatorState extends State<Client_creator> {

  File? image;
  DateTime selectedDate = DateTime.now();
  int year = 0;
  Data_Base Data_Base_work = Data_Base();
  List UserInfo=['Нет данных','Нет данных','Нет данных','Нет данных','Нет данных'];


  ///ДАнные к заполнениею обязаловка
  String? _NameClient;// ввод (обязательно)

  int? _NumberPhoneHome;//to int ввод (НЕ обязательно)

  int? _NumberPhone;//to int ввод (обязательно)

  String? _Adress;//(НЕ обязательно)

  //DateTime? _DateCreate;//(автоматический ввод)

  User? _Author;//(автоматический ввод)

  DateTime? _DateBrithDay;//to data ввод (обязательно)

  int? _Year;//to int ввод если выбрана дата рождения (автоматический ввод)

  String? _ImagePath;//картинка (НЕ обязательно)

 // String? _QrId;//Уникальный Qr Id который есть только у этого пользователя просто ID поработать над его иникальностью (автоматический ввод)


  _changeNameClient(String Text){
    setState(() =>_NameClient = Text);
  }

  _changeNumberPhone(String Text){
    try{_NumberPhone = int.parse(Text);print("я преобразовал($_NumberPhone)");}
    catch(e){Toast("Ввод данных только цыфры без плавущих точек[.]");print("Ввод данных только цыфры без плавущих точек[.]");}

  }

  _changeNumberPhoneHome(String Text){
    try{_NumberPhoneHome = int.parse(Text);print("я преобразовал($_NumberPhoneHome)");}
    catch(e){Toast("Ввод данных только цыфры без плавущих точек[.]");print("Ввод данных только цыфры без плавущих точек[.]");}

  }

  _changeAdress(String Text){
    setState(() =>_Adress = Text);
  }




  _Client_creatorState(){
    GetUserInfo();

  }

  void GetUserInfo()async{
    UserInfo = await Data_Base_work.ReadID('DataApp', 'DataAppMenu');
    setState(() {});
    print(UserInfo);
  }


  void Toast(String Message){
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text(Message),duration: Duration(seconds: 1),));
  }

  Future pickImage(ImageSource source) async{

 try
 {
   final image = await ImagePicker().pickImage(source: source);
   if(image==null)return;
   final path = await getApplicationDocumentsDirectory();
   final pathStr = path.path;
   print(path.path);
   final fileName = image.name;
   await image.saveTo('$pathStr/$fileName');
   final imageTemporary = File('$pathStr/$fileName');
   print('$pathStr/$fileName');
   _ImagePath ='$pathStr/$fileName';
   setState(() => this.image = imageTemporary);
 }
 on PlatformException catch (e)
 {
   print('Прблема возникла:$e');
 }
  }


  ProvAuth() {
    bool _prov = true;
    if(_NameClient=="" || _NameClient == null){Toast("Запоните Имя ученика!");print('Запоните Имя ученика!значение($_NameClient)');_prov = false;}
    if(_NumberPhone==0 || _NumberPhone == null){Toast("Запоните Номер Ученика!");print('Запоните Номер Ученика!значение($_NumberPhone)');_prov = false;}
    if(_DateBrithDay == null){Toast("Запоните дату рождения ученика!");print('Запоните дату рождения ученика!значение($_DateBrithDay)');_prov = false;}


    return _prov;
  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1920, 1),
        lastDate: DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        year =  DateTime.fromMillisecondsSinceEpoch(DateTime.now().difference(selectedDate).inMilliseconds).year - 1970  ;
        _Year = year;
        _DateBrithDay = selectedDate;

      });
  }


  void CreateClient()async{
    if(ProvAuth()){
      var UserBox = await Hive.openBox('TestBox');
      User UserNeed = await Data_Base_work.ReadID('TestBox', UserInfo[4]);
      HiveList<User> SearchUser = HiveList(UserBox,objects: [UserNeed]);
      var ClientWrite = Client(_NameClient!, _NumberPhoneHome!, _NumberPhone!, _Adress!, DateTime.now(), SearchUser, _DateBrithDay!, _Year!, _ImagePath!);// Aboniment(_NumberAbo!, _NameAbo!, DateTime.now(), _KolVoZan!, _KolVoDay!, _Price!, SearchUser );
      Data_Base_work.Write( ClientWrite, 'TestBoxClient');
      print('Записал');
      Toast("Записал");

    }
    else{
      print("Не записал");
      Toast("Не записал");
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MenuDrawer(),
        body:SingleChildScrollView(
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
              labelText: 'ФИО',
              filled: true,
              fillColor: Colors.white,
            ),
                onChanged: _changeNameClient
            ),
            TextField( decoration: InputDecoration(
              labelText: 'Введите номер телефона домашнего',
              filled: true,
              fillColor: Colors.white,
            ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: _changeNumberPhoneHome
            ),

            TextField( decoration: InputDecoration(
              labelText: 'Введите номер мобильного телефона',
              filled: true,
              fillColor: Colors.white,
            ),

              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: _changeNumberPhone
            ),

            TextField( decoration: InputDecoration(
              labelText: 'Введите адрес проживание',
              filled: true,
              fillColor: Colors.white,
            ),

                onChanged: _changeAdress

            ),



              SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Выберите дату рождения'),
              ),
            Text("${selectedDate.toLocal()}".split(' ')[0]),



            Text("ВОЗРАСТ:$year"),

     /*       DropdownButton<String>(
              items: <String>['A', 'B', 'C', 'D'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: Column(S
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text("Название:$value"),
                      new Text("УК:0001"),
                      new Text("Номер:1")

                    ],),
                );
              }).toList(),
              hint: Text("Выбери абонимент"),
              onChanged: (value) {print(value);},
            ),
*/
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null ? Image.file(image!,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ):FlutterLogo(size: 160,),
                Text("Выберите фото"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: ()=>pickImage(ImageSource.camera), child:Text("Камера", style: TextStyle(fontSize: 22),)),
                    ElevatedButton(onPressed: ()=>pickImage(ImageSource.gallery), child:Text("Галерея", style: TextStyle(fontSize: 22),)),

                  ],),
              ],),

         //   QrImage(
            //  data: '0',
           //   version: QrVersions.auto,
           //   size: 320,
           //   gapless: false,
             //(на случай если захочеться добавить емблему) embeddedImage: AssetImage('assets/images/logo.png'),
              //embeddedImageStyle: QrEmbeddedImageStyle(
                //size: Size(80, 80),),
       //     ),

            ElevatedButton(onPressed: (){ CreateClient();}, child:Text("Сохранить", style: TextStyle(fontSize: 22),)),
            ElevatedButton(onPressed: (){}, child:Text("Очистить", style: TextStyle(fontSize: 22),)),
          ],),
        ),
        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }

}

