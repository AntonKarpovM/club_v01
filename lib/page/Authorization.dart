 import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:club_v01/DataBase/DataBase.dart';
import 'package:path_provider/path_provider.dart';


class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  _AuthorizationState createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  //переменная для бд
  Data_Base Data_Base_work = Data_Base();
  //переменны для данных логин
  String? _Login;
  String? _Pass;
  DateTime? _Data;
  String? _ImagePath;
  // вспомогательные переменные
  File? image;


  ProvAuth(bool NonImage) {
    bool _prov = true;
    if(_Login=="" || _Login == null){Toast("Запоните Логин!");print('Запоните Логин!');_prov = false;}
    if(_Pass=="" || _Pass == null){Toast("Запоните Пароль!");print('Запоните Пароль!');_prov = false;}
    if(NonImage){if(_ImagePath=="" || _ImagePath == null){Toast("Запоните Фото!");print('Запоните Фото!');_prov = false;}}
    return _prov;
  }

  void CreateUser()async{
    if(ProvAuth(true)){
      if(await SearchUser()== null){
        Data_Base_work.Write(User(_Login!,_Pass!, _Data!, _ImagePath!), 'TestBox');
        print('Записал');
        Toast("Записал");
      }
      else{
        Toast("Такой польщователь уже есть");
        print("Такой польщователь уже есть");
      }

    }
    else{
      print("Не записал");
      Toast("Не записал");
    }
  }

  void Toast(String Message){
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: new Text(Message),duration: Duration(seconds: 1),));
  }

  Future<List?> SearchUser()async{

    if(ProvAuth(false)){
      List<List<dynamic>> data = await Data_Base_work.Read("TestBox");
      int i = data.length;
      while(i>0){
        i = i-1;
        if(data[i][0]==_Login && data[i][1]==_Pass){
          print('нашел');
          Toast("нашел");
            return data[i];
        }
      }
    }
    else{
      print('Что-то упустили');
    }
  }

 void Coming() async {
   List FindUser =await SearchUser() as List;
    if(FindUser!= null){
      Toast("пользователь есть");
      print(FindUser);
      Data_Base_work.WritePut(FindUser, 'DataApp', 'DataAppMenu');
      Navigator.pushNamed(context, '/help');
    }
    else{
      Toast("пользователь не наден");
    }
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
      Toast("пользователь есть");

    }
  }

  _changeLogin(String text){
    setState(() =>_Login = text);
  }

  _changePass(String text){
    setState(() =>_Pass = text);
  }

  void Message(){
    print("Данные[Логин:($_Login);Пароль:($_Pass);Дата:($_Data);Путь к картинке:($_ImagePath);]");
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
          child:  Column(children: [

           Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                image != null ? Image.file(image!,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ):FlutterLogo(size: 160,),
                Text("Выберите фото(пожеланию)"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: ()=>pickImage(ImageSource.camera), child:Text("Камера", style: TextStyle(fontSize: 22),)),
                    ElevatedButton(onPressed: ()=>pickImage(ImageSource.gallery), child:Text("Галерея", style: TextStyle(fontSize: 22),)),

                  ],),
              ],),


            TextField( decoration: InputDecoration(
              labelText: 'Логин',
              filled: true,
              fillColor: Colors.white,

            ),
                onChanged: _changeLogin
            ),
            TextField( decoration: InputDecoration(
              labelText: 'Пароль',
              filled: true,
              fillColor: Colors.white,
            ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: _changePass
            ),






            ElevatedButton(onPressed: (){Coming();Message();}, child:Text("Войти", style: TextStyle(fontSize: 22),)),
            ElevatedButton(onPressed: (){_Data=DateTime.now();CreateUser();Message();}, child:Text("Создать", style: TextStyle(fontSize: 22),)),
            ElevatedButton(onPressed: (){}, child:Text("Очистить", style: TextStyle(fontSize: 22),)),
          ],),
        ),
        appBar: AppBar(
          title: Text('CLUB POLE DANCE'),
          centerTitle: true,
        ));
  }

}

