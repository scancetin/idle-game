// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:idle_game/model/shared_prefs.dart';
import 'package:idle_game/model/user_model.dart';
import 'package:provider/provider.dart';

class PointWidget extends StatelessWidget {
  final bool isSpecialCoin;
  const PointWidget({Key? key, required this.isSpecialCoin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, model, child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 25,
        width: 75,
        child: Center(
          child: Text(
            "${isSpecialCoin ? model.getSpecialCoin() : model.getCoin()} 💰",
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
        ),
      );
    });
  }
}
