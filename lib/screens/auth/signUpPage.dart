import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sphinx/screens/auth/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sphinx/screens/test.dart';

import '../../clusess.dart';
import '../../const/variable_const.dart';
class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  bool _emaielcheck = false;


  String passowrd1="";
  String passowrd2="";

  String email = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading:  InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));

            },
            child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Sphinx",
                style:  TextStyle(
                    fontSize: 30,
                    color: Color(0xFF163479),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:  "Registration",
                      style:  TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '👍', // emoji characters
                      style:  TextStyle(
                          fontSize: 30
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Lets Register.Apply to jobs!",
                style:  TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: height / 60,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon:Icon(Icons.person) ,
                  hintText: (" Full Name"),
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: height / 60,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                  if (email.contains(".com", 1)) {
                    _emaielcheck = true;
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: Icon(
                    CupertinoIcons.checkmark_circle,
                    color: _emaielcheck == false
                        ? Colors.grey
                        : Colors.green,
                  ),
                  hintText: ("E-mail"),
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: height / 60,
              ),
              TextFormField(
                onChanged: (value) {
                  passowrd1 = value;

                  setState(() {});
                },
                obscureText: _obscureText,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: InkWell(
                      onTap: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      child: Icon(
                        _obscureText
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill,
                      )),
                  hintText: ("Password"),
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: height / 60,
              ),
              TextFormField(
                onChanged: (value) {
                  passowrd2 = value;

                  setState(() {});
                },
                obscureText: _obscureText,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.key),
                  suffixIcon: InkWell(
                      onTap: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      child: Icon(
                        _obscureText
                            ? CupertinoIcons.eye_fill
                            : CupertinoIcons.eye_slash_fill,
                      )),
                  hintText: ("Confirm Password"),
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: height / 20,
              ),
              InkWell(
                onTap: (){
                  if(passowrd1==passowrd2 ){
                    register(emailAddress: email, password: passowrd1, context: context); // تمرير السياق هنا
                  }
                  else{
                    print("password not -------");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF163479),
                      borderRadius: BorderRadius.circular(15)),
                  height: 60,
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 25,
              ),
              Row(
                children: const [
                  Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )),
                  Text(
                    "OR Continue with",
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                  Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Icon(Icons.apple,
                      color: Colors.black,
                      size: 55,
                    ),
                    Image.asset(google,width: 70,height: 70,),
                    Icon(Icons.facebook,
                      color: Color(0xFF163479),
                      size: 55,
                    ),
                  ],
                ),
              ),
              SizedBox(
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [
                  Text(
                    "Already Have Account? ",
                    style:
                    TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => login()));

                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          color: Color(0xFF163479),
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}






