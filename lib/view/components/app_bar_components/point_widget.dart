// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:provider/provider.dart';

class PointWidget extends StatelessWidget {
  final bool isSpecialCoin;
  const PointWidget({Key? key, required this.isSpecialCoin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserStatsController userStatsCon = UserStatsController(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      height: KSizer.pointH,
      width: KSizer.pointW,
      child: Center(
        child: Consumer<UserStatsModel>(builder: (context, model, child) {
          return Text(
            "${userStatsCon.getCoinByType(isSpecialCoin)} 💰",
            style: TextStyle(fontSize: KSizer.pointTextS, color: Colors.black),
          );
        }),
      ),
    );
  }
}
