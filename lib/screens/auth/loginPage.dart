import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sphinx/clusess.dart';
import 'package:sphinx/const/variable_const.dart';
import 'package:sphinx/screens/auth/signUpPage.dart';

import '../spash_screen/firstpage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();

}

class _loginState extends State<login> {
  bool _obscureText = true;
  bool _emailchick = false;
  String email = "";
  String password="";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstPage()));

            },
            child: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,)),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Sphinx",
                style:  TextStyle(
                    fontSize: 30,
                    color:  Color(0xFF356899),
                    fontWeight: FontWeight.bold),
              ),
               SizedBox(
                height: 10,
              ),
              RichText(
                text:
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:  "Welcome Back ",
                      style:  TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '👋', // emoji characters
                      style:  TextStyle(
                          fontSize: 30
                      ),
                    ),
                  ],
                ),
              ),
               SizedBox(
                height: 10,
              ),
               Text(
                "Lets log in.Apply to jobs!",
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
                onChanged: (value) {
                  email = value;
                  if (email.contains(".com", 1)) {
                    _emailchick = true;
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: Icon(
                    CupertinoIcons.checkmark_circle,
                    color: _emailchick == false
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
                    password = value;
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
                height: height / 20,
              ),

              InkWell(
                onTap: (){
                  loginAuth(emailAddress: email, password: password, context: context);

              },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color:  Color(0xFF356899),
                      borderRadius: BorderRadius.circular(15)),
                  height: 60,
                  child:  Text(
                    "log in",
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
              const Center(
                child:   Text(
                  "forgot password?",
                  style:  TextStyle(
                      fontSize: 25,
                      color:  Color(0xFF356899),
                      fontWeight: FontWeight.w400),
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
                height: height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [
                  Text(
                    "Don't Have Account? ",
                    style:
                    TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));

                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          color:  Color(0xFF356899),
                        fontWeight: FontWeight.bold,
                        fontSize: 18
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
