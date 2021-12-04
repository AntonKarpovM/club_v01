import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'DataBase.g.dart';


class Data_Base extends ReadWriter {

  //инициализация
  Data_Base(){
    Start();
  }

  //Функция
  void Start()async{
    String NameT = "Function";
    String Name = "Start";
    Message(NameT,Name,"Инициализация HIVE");
  }

  //Функция сообщений




  Future< List<List<dynamic>>> Date_Base_Stat() async{
    String Name = "Date_Base_User";
    List<List<dynamic>> DataExport = [];
    DataExport.add(["test","test"]);
    DataExport.add(["Размер бд(мб):",]);
    DataExport.add(["Кол-во акк:",132]);
    DataExport.add(["Кол-во клиентов:",132]);
    DataExport.add(["Кол-во абониментов:",132]);
    DataExport.add(["последние внесение в бд:",132]);
    DataExport.add(["Послдняя выгрузка бд:",132]);
    return DataExport;
  }


}

class ReadWriter{
  ReadWriter(){

  }
   var box;

  Future< List<List<dynamic>>> Read(String NameBox)async{
    String NameT = "Function";
    String Name = "Read[ReadWriter]";
    List<List<dynamic>> DataExport = [];
    box = await Hive.openBox(NameBox);
    int BoxL = box.length;
    while(BoxL>0)
    {
      BoxL = BoxL -1;
      DataExport.add(box.getAt(0)?.DataExport());
    }
    Message(NameT,Name, "Вытащили данные из тестовой таблицы ($NameBox)");
    return DataExport;
  }
// я как даун занес "NameBox" в боксы
  void Write(var ObjectAdd,String NameBox) async{
    String NameT = "Function";
    String Name = "Write[ReadWriter]";
    box = await Hive.openBox(NameBox);
    box.add(ObjectAdd);

    Message(NameT,Name, "открыли тест таблицу($NameBox ) и записали ($ObjectAdd)");

  }

  void ClosedBox(String NameBox){
   Hive.box(NameBox).close();
  }

  void DeliteBox(String NameBox){
    Hive.deleteBoxFromDisk(NameBox);
  }

}






//Юзер
@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String Login;
  @HiveField(1)
  String Pass;
  @HiveField(2)
  int Date;

  User(this.Login,this.Pass,this.Date);

  @override
  String  toString() => "Login($Login):Pass( $Pass):Date( $Date)";

 List<dynamic> DataExport() => [Login,Pass,Date];
}




void Message(String NT,NF,Mess) async {
  print('Тип обьекта($NT):Название($NF):Сообщенние($Mess)');
}
