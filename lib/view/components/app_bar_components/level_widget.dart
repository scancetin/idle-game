// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/model/shared_prefs.dart';
import 'package:idle_game/model/user_model.dart';
import 'package:provider/provider.dart';

class LevelWidget extends StatelessWidget {
  const LevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, model, child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        height: 25,
        width: 75,
        child: Center(
          child: Text(
            "Level ${model.getLevel()}",
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
        ),
      );
    });
  }
}
