// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:provider/provider.dart';
import '../../../controller/user_stats_controller.dart';

class LevelWidget extends StatelessWidget {
  const LevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    UserStatsController userStatsCon = UserStatsController(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 25,
      width: 75,
      child: Consumer<UserStatsModel>(builder: (context, model, child) {
        return Center(
          child: Text(
            "Level ${userStatsCon.getLevel()}",
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
        );
      }),
    );
  }
}
