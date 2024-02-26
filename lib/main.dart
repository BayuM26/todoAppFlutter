import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/page/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // initialisasi flutter hive
  // kegunaan hive untuk local storage laravel dalam bentuk json
  await Hive.initFlutter();

  await Hive.openBox('MyBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: HomePage(),
    );
  }
}


