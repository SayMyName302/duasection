import 'package:duasection/containers.dart';

import 'package:duasection/test1.dart';
import 'package:duasection/test2.dart';
import 'package:duasection/test3.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    //flutter k andr wudgets use ki jaati hain
    //e.g text , icons , status bar , app bar, body ,heiarchy widgets hoti h

    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute:
          "/mainpage", //initial route mein back slash/ replace hojata hai
      routes: {
        "/": (context) => const mainpage(),
        "duasection": (context) => const duasection(),
        "test2": (context) => const test2(),
        "test3": (context) => const test3(),
      },
    );
  }
}
