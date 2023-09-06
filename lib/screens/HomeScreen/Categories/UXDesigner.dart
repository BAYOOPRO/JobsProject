import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sphinx/const/variable_const.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../hive/hive_helper.dart';
import '../categorie.dart';

class UXDesigner extends StatefulWidget {
  const UXDesigner({super.key});

  @override
  State<UXDesigner> createState() => _UXDesignerState();
}

class _UXDesignerState extends State<UXDesigner> {
  String title="";
  String salary="";
  String body="";
  String place="";
  String phone="";
  String phoneNOTused="";
  final message = 'اهلا بك \n اريد اقدم لك فرصه للتوظيف معنا'; // رسالة الWhatsApp المراد إرسالها



  @override
  void initState() {
    HiveHelper.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // هنا يتم تحديد الأيقونة التي تريدها
          onPressed: () {
            Get.off(Categorie());

          },
        ),
        backgroundColor: Colors.black,
        title: Text("UX Designer",style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async{
            AlertDialog alert= AlertDialog(
              title: Text("add your Jobs"),
              content: SingleChildScrollView(
                child: Container(
                  height: 400,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: ("Title"),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          title = value;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: ("Salary"),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          salary = value;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: ("Name"),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          body = value;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: ("Place"),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          place = value;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: ("+201094197704"),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        onChanged: (value) {
                          phone = value;
                        },
                      ),

                    ],
                  ),
                ),
              ),

              actions: [
                TextButton(
                  child: Text("add"),
                  onPressed: (){
                    // HiveHelper.noteList.add(_notesController.text);
                    HiveHelper.addNote(title: title, body: body, salary: salary, place: place,phone: phone);

                    Navigator.pop(context);
                    setState(() {

                    });


                  },
                )
              ],
            );
            await showDialog(
                context: context,
                builder: (BuildContext context){
                  return alert;
                }

            );
          },
          child: Icon(Icons.add)
      ),
      body: ListView.builder(
          itemCount:HiveHelper.tileList.length,
          itemBuilder: (context,index)=>Dismissible(
            onDismissed: (val){
              HiveHelper.removeNote(index);
            },
            key: UniqueKey(),
            child: InkWell(
              onTap: () async{
                title=HiveHelper.tileList[index];
                salary=HiveHelper.salaryList[index];
                body=HiveHelper.bodyList[index];
                place=HiveHelper.placeList[index];
                phone=HiveHelper.phoneList[index];


                AlertDialog alert= AlertDialog(
                  title: Text("Edit your jobss"),
                  content: SingleChildScrollView(
                    child: Container(
                      height: 400,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: ("Title"),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              title = value;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: ("Salary"),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              salary = value;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: ("Name"),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              body = value;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: ("Place"),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              place = value;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: ("+201094197704"),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            onChanged: (value) {
                              phone = value;
                            },
                          ),

                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text("Edit"),
                      onPressed: (){
                        HiveHelper.tileList[index]=title;
                        HiveHelper.bodyList[index]=body;
                        HiveHelper.salaryList[index]=salary;
                        HiveHelper.placeList[index]=place;
                        HiveHelper.phoneList[index]=phone;

                        Navigator.pop(context);
                        setState(() {

                        });


                      },
                    )
                  ],
                );
                await showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return alert;
                    }

                );


              },
              child: Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 10), // تحديد المسافة من الحافة اليمنى
                          child: Text(
                            HiveHelper.tileList[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 30,top: 20), // تحديد المسافة من الحافة اليمنى
                          child: Text(
                            "\$"+HiveHelper.salaryList[index]+"/m",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 10), // تحديد المسافة من الحافة اليمنى
                          child: Text(
                            HiveHelper.bodyList[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 30,top: 20), // تحديد المسافة من الحافة اليمنى
                          child: Text(
                            HiveHelper.placeList[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 22), // تحديد المسافة من الحافة اليمنى
                          child: InkWell(
                              onTap: (){
                                phoneNOTused=HiveHelper.phoneList[index];
                                launchUrlString('https://wa.me/$phoneNOTused/?text=$message');
                              },
                              child: Image.asset(whatsapp,height: 35,width: 35,)
                          )
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 30,top: 20), // تحديد المسافة من الحافة اليمنى
                          child: InkWell(
                            onTap: (){
                              phoneNOTused=HiveHelper.phoneList[index];
                              launchUrlString("tel:$phoneNOTused");

                            },
                            child: Text(
                              HiveHelper.phoneList[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),




                  ],
                ),
              ),
            ),
          )),

    );
  }
}

