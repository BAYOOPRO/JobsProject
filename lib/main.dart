import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sphinx/screens/screen1.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'hive/hive_helper.dart';


void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox(HiveHelper.MyBox);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
  }
}
