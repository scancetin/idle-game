// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/view/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Idle Farm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
