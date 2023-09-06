import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sphinx/clusess.dart';
import 'package:sphinx/screens/HomeScreen/Categories/UXDesigner.dart';

import '../../const/variable_const.dart';

class Categorie extends StatelessWidget {
  const Categorie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E0),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              children: [

                InkWell(
                  onTap: (){
                  logOut();

                  },
                  child: Icon(
                    Icons.assignment_return_outlined,
                    color: Colors.black,
                  ),
                ),
                Text("Sign Out"),
                SizedBox(
                  width: 35,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Popular",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: (){
                      Get.off(UXDesigner());

                    },
                    child: buildContainer_Categories(image: AssetImage('assets/images/UXDesigner.png'), text: "UX Designer")),
                SizedBox(width: 20),
                buildContainer_Categories(image: AssetImage('assets/images/WebDeveloper.png'), text: "Web Developer"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildContainer_Categories(image: AssetImage('assets/images/SoftwareEngineer.png'), text: "Software Engineer"),
                SizedBox(width: 20),
                buildContainer_Categories(image: AssetImage('assets/images/ProductManager.png'), text: "Product Manager"),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Text(
                  "Trending",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildContainer_Categories(image: AssetImage('assets/images/Accountant.png'), text: "Accountant"),
                SizedBox(width: 20),
                buildContainer_Categories(image: AssetImage('assets/images/Marketing.png'), text: "Marketing"),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildContainer_Categories(image: AssetImage('assets/images/AppDeveloper.png'), text: "App Developer"),
                SizedBox(width: 20),
                buildContainer_Categories(image: AssetImage('assets/images/GraphicDesigner.png'), text: "Graphic Designer"),
              ],
            ),

          ],
        ),
      ),
    );
  }

}
