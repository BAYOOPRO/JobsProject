import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sphinx/screens/spash_screen/firstpage.dart';

import '../const/variable_const.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        Get.offAll(FirstPage())
    );
    //    Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context)=>Screen2()),
    //     (Route<dynamic> route)=>false,
    // )
    // );
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(firstPage)
            ,fit: BoxFit.cover),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(sphinx)
          ],
        ),

    )
    );
  }
}
