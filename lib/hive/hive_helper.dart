import 'package:hive/hive.dart';

class HiveHelper{
  static const MyBox="Sphinx_BOX";
  static const titleBoxKey="title_BOX_KEY";
  static const bodyBoxKey="body_BOX_KEY";
  static const salaryBoxKey="salary_BOX_KEY";
  static const placeBoxKey="place_BOX_KEY";
  static const phoneBoxKey="phone_BOX_KEY";


  static var myBox=Hive.box(MyBox);

  static List<String> tileList=[];
  static List<String> bodyList=[];
  static List<String> salaryList=[];
  static List<String> placeList=[];
  static List<String> phoneList=[];

  static void addNote({
    required String title,
    required String body,
    required String salary,
    required String place,
    required String phone,


  }) async{
    var myBox=Hive.box(MyBox);
    tileList.add(title);
    bodyList.add(body);
    salaryList.add(salary);
    placeList.add(place);
    phoneList.add(phone);

    await myBox.put(titleBoxKey, tileList);
    await myBox.put(bodyBoxKey, bodyList);
    await myBox.put(salaryBoxKey, salaryList);
    await myBox.put(placeBoxKey, placeList);
    await myBox.put(phoneBoxKey, phoneList);


    print("add sucsess");
  }

  static void removeNote(int index)async{
    HiveHelper.tileList.removeAt(index);
    HiveHelper.salaryList.removeAt(index);
    HiveHelper.bodyList.removeAt(index);
    HiveHelper.placeList.removeAt(index);
    HiveHelper.phoneList.removeAt(index);


    await myBox.put(titleBoxKey, tileList);
    await myBox.put(salaryBoxKey, salaryList);
    await myBox.put(bodyBoxKey, bodyList);
    await myBox.put(placeBoxKey, placeList);
    await myBox.put(phoneBoxKey, phoneList);



  }


  static void getNotes() {
    if (myBox.isNotEmpty) {
      tileList = myBox.get(titleBoxKey) ?? <String>[];
      bodyList = myBox.get(bodyBoxKey) ?? <String>[];
      salaryList = myBox.get(salaryBoxKey) ?? <String>[];
      placeList = myBox.get(placeBoxKey) ?? <String>[];
      phoneList = myBox.get(phoneBoxKey) ?? <String>[];
    } else {
      // تعيين قيم افتراضية إذا لم تكن هناك بيانات مخزنة بعد
      tileList = <String>[];
      bodyList = <String>[];
      salaryList = <String>[];
      placeList = <String>[];
      phoneList = <String>[];
    }
  }

}