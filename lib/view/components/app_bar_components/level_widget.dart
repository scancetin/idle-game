// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LevelWidget extends StatelessWidget {
  const LevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 25,
      width: 75,
      child: Center(
        child: Text(
          "Level 20",
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),
      ),
    );
  }
}
