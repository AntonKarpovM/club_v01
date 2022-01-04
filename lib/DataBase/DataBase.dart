import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'DataBase.g.dart';

///список ебанных ящиков [TestBox](описание:{Тестовый ящик с юзерами})
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
      List KeyAdd = box.getAt(BoxL)?.DataExport();
      KeyAdd.add(box.getAt(BoxL)?.key);
      DataExport.add(KeyAdd);

    }
    Message(NameT,Name, "Вытащили данные из тестовой таблицы ($NameBox)");
    return DataExport;
  }

  Future Read_and_get_box(String NameBox)async{
    String NameT = "Function";
    String Name = "Read[Read_and_get_box]";

    box = await Hive.openBox(NameBox);

    Message(NameT,Name, "Вытащили данные из тестовой таблицы ($NameBox)");
    return  box;
  }





// я как даун занес "NameBox" в боксы
  void Write(var ObjectAdd,String NameBox) async{
    String NameT = "Function";
    String Name = "Write[ReadWriter]";
    box = await Hive.openBox(NameBox);
    box.add(ObjectAdd);

    Message(NameT,Name, "открыли тест таблицу($NameBox ) и записали ($ObjectAdd)");

  }


  void WriteDataBaseObject(var ObjectAdd,String NameBox) async{
    String NameT = "Function";
    String Name = "Write[ReadWriter]";
    box = await Hive.openBox(NameBox);
    box.add(ObjectAdd.key);
User Man = User('Login', 'Pass', DateTime.now(), 'ImagePath');
Man.key;
    Message(NameT,Name, "открыли тест таблицу($NameBox ) и записали ($ObjectAdd)");

  }


  void ClosedBox(String NameBox){
   Hive.box(NameBox).close();
  }

  void DeliteBox(String NameBox){
    Hive.deleteBoxFromDisk(NameBox);
  }

  Future<int> BoxLength(String NameBox) async {
    if(!Hive.isBoxOpen(NameBox)){box = await Hive.openBox(NameBox);}
    return box.length;
  }


  void WritePut(var ObjectAdd,String NameBox,String ID) async{
    String NameT = "Function";
    String Name = "Write[ReadWriter]";
    box = await Hive.openBox(NameBox);
    box.put(ID,ObjectAdd);

    Message(NameT,Name, "открыли тест таблицу($NameBox ) и записали ($ObjectAdd)");

  }


  Future <dynamic> ReadID(String NameBox,ID)async{
    String NameT = "Function";
    String Name = "Read[ReadWriter]";
    dynamic ObjectReturn;
    box = await Hive.openBox(NameBox);
    ObjectReturn = box.get(ID);


    Message(NameT,Name, "Вытащили данные из тестовой таблицы ($NameBox)");
    return ObjectReturn;
  }


}






//Юзер
@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String Login;
  @HiveField(1)
  String Pass;
  @HiveField(2)
  DateTime Date;
  @HiveField(3)
  String ImagePath;
  User(this.Login,this.Pass,this.Date,this.ImagePath);

  @override
  String  toString() => "$Login):Pass( $Pass):Date( $Date):ImagePath( $ImagePath)";

 List<dynamic> DataExport() => [Login,Pass,Date,ImagePath];
}



//Абонименты
@HiveType(typeId: 1)
class Aboniment extends HiveObject{
  @HiveField(0)
  int NumberAbo;
  @HiveField(1)
  String NameAbo;
  @HiveField(2)
  DateTime DateCreate;
  @HiveField(3)
  int KolVoZan;
  @HiveField(4)
  int KolVoDay;
  @HiveField(5)
  double Price;
  @HiveField(6)
  HiveList<User>? Author;




  Aboniment(this.NumberAbo,this.NameAbo,this.DateCreate,this.KolVoZan,this.KolVoDay,this.Price,this.Author);

  @override
  String  toString() => "Номер($NumberAbo):Имя( $NameAbo):Date( $DateCreate):Количество занятий( $KolVoZan):Количество дней($KolVoDay):Цена($Price):Автор($Author)";

  List<dynamic> DataExport() => [NumberAbo,NameAbo,DateCreate,KolVoZan,KolVoDay,Price,Author];
}










//Клиенты
@HiveType(typeId: 2)
class Client extends HiveObject{
  @HiveField(0)
  String NameClient;
  @HiveField(1)
  int NumberPhoneHome;
  @HiveField(2)
  int NumberPhone;
  @HiveField(3)
  String Adress;
  @HiveField(4)
  DateTime DateCreate;
  @HiveField(5)
  HiveList<User>? Author;
  @HiveField(6)
  DateTime DateBrithDay;
  @HiveField(7)
  int Year;
  @HiveField(8)
  String ImagePath;




  Client(this.NameClient,this.NumberPhoneHome,this.NumberPhone,this.Adress,this.DateCreate,this.Author,this.DateBrithDay,this.Year,this.ImagePath);

  @override
  String  toString() => "Номер домашний($NumberPhoneHome):Имя( $NameClient):Date( $DateCreate):Номер Мобильника( $NumberPhone):Адресс($Adress):Дата Рождения($DateBrithDay):Автор($Author):Количество лет($Year):Картинка($ImagePath)";

  List<dynamic> DataExport() => [NameClient,NumberPhoneHome,NumberPhone,Adress,DateCreate,Author,DateBrithDay,Year,ImagePath];
}





void Message(String NT,NF,Mess) async {
  print('Тип обьекта($NT):Название($NF):Сообщенние($Mess)');
}
