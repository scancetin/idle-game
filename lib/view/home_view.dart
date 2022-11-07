// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:idle_game/view/layout/crop_plot_layout.dart';
import 'package:idle_game/view/layout/sliding_panel_layout.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'components/app_bar_components/level_widget.dart';
import 'components/app_bar_components/point_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        title: Row(
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
