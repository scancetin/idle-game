// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 25,
      width: 75,
      child: Center(
        child: Text(
          "999k 💰",
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),
      ),
    );
  }
}
