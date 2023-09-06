import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sphinx/screens/auth/loginPage.dart';

import '../../const/variable_const.dart';
import '../auth/signUpPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int count=0;
  String image=pageList[0];
  String title=titleList[0];
  String body=bodyList[0];
  String frame=frameList[0];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(circle),
            Image.asset(image,width: 250,height: 250,),
            Text(title,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 20,),
            Container(
              width: 280,
              child: Text(body, textAlign: TextAlign.center,style: TextStyle(
                fontSize: 15,
                color: Color.fromRGBO(149, 150,157, 1.0),


              ),),
            ),
            SizedBox(height: 50,),
            Image.asset(frame,width: 100,),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));

                    },
                    child: Text(count<3?"Skip":"",style: TextStyle(
                        color: Color.fromRGBO(149, 150,157, 1.0),
                        fontSize: 20
                    )
                      ,),
                  ),
                  SizedBox(width: 100,),
                  Container(
                    width: 140,height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(44, 85, 125, 1.0),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          if(count<3){
                            _changeBoard();
                          }
                          else{
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));

                          }
                        },

                        child: Text(count<3?"Next":"finsh",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100,)

                ],
              ),
            )
          ],
        )
      ),
    );
  }

void _changeBoard(){
    if(count<4)
      count++;
    print("--------");
      image=pageList[count];
      title=titleList[count];
      body=bodyList[count];
      frame=frameList[count];


     setState(() {

     });

}
}





