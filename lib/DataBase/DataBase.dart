import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';



class Data_Base
{

  //инициализация
  Data_Base(){
    Start();
  }

  //Функция
  void Start()async{
    String Name = "Start";
    Message(Name,"Инициализация HIVE");
  }

  //Функция сообщений
  void Message(String NF,Mess) async {
   print('Название функции($NF):Сообщенние($Mess)');
  }

   Future< List<List<dynamic>>> Date_Base_User() async {
     String Name = "Date_Base_User";
     List<List<dynamic>> DataExport = [];
     var box = await Hive.openBox<User>("TestUser");
     final user = User('Anton','12',555);

     DataExport.add(["test","test","test"]);


     await box.add(user);
     int BoxL = box.length;
     while(BoxL>0)
     {
       BoxL = BoxL -1;
       DataExport.add([box.getAt(BoxL)!.Login,box.getAt(BoxL)!.Pass,box.getAt(BoxL)!.Date]);
     }
      Message(Name, "Вытащили данные из тестовой таблицы USER");
    return DataExport;



  }




}

//Юзер
class User{

  String Login;
  String Pass;
  int Date;
  User(this.Login,this.Pass,this.Date);

  @override
  String  toString() => "Login($Login):Pass( $Pass):Date( $Date)";


}


//Адаптер юзера
class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    final LoginUser = reader.readString();
    final PassUser =reader.readString();
    final DateUser =reader.readInt();
    return User(LoginUser,PassUser,DateUser);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.Login);
    writer.write(obj.Pass);
    writer.write(obj.Date);
  }
}