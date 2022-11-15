import 'package:flutter/material.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/constants.dart';
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
        borderRadius: BorderRadius.circular(6),
      ),
      height: KSizer.pointH,
      width: KSizer.pointW,
      child: Consumer<UserStatsModel>(builder: (context, model, child) {
        return Center(
          child: Text(
            "Level ${userStatsCon.getLevel()}",
            style: TextStyle(fontSize: KSizer.pointTextS, color: Colors.black),
          ),
        );
      }),
    );
  }
}
