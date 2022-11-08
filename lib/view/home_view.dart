// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/view/layout/crop_plot_layout.dart';
import 'package:idle_game/view/layout/sliding_panel_layout.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'components/app_bar_components/level_widget.dart';
import 'components/app_bar_components/point_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserStatsController userStatsCon = UserStatsController(context);
    CropController cropCon = CropController(context);

    return Scaffold(
      appBar: AppBar(
        leading: Consumer2<UserStatsModel, CropModel>(builder: (context, userModel, cropModel, child) {
          return IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              cropCon.restartGame();
              userStatsCon.restartGame();
            },
          );
        }),
        title: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            PointWidget(isSpecialCoin: true),
            SizedBox(width: 10),
            PointWidget(isSpecialCoin: false),
            Spacer(),
            LevelWidget(),
          ],
        ),
      ),
      body: SlidingUpPanel(
        panel: SlidingPanelLayout(),
        color: Colors.black,
        minHeight: 80,
        backdropEnabled: true,
        body: CropPlotLayout(),
      ),
    );
  }
}
