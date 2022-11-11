// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:provider/provider.dart';
import '../components/crop_plot_components/crop_plot_line.dart';

class CropPlotLayout extends StatelessWidget {
  const CropPlotLayout({super.key});

  @override
  Widget build(BuildContext context) {
    CropController cropCon = CropController(context);
    UserStatsController userStatsCon = UserStatsController(context);
    userStatsCon.idleIncome(cropCon);

    return Padding(
      padding: EdgeInsets.only(bottom: KSizer.cropPaddingB, top: KSizer.cropPaddingT),
      child: Consumer<CropModel>(builder: (context, model, child) {
        return ListView.builder(
            itemCount: cropCon.plotSize(),
            itemBuilder: (context, index) {
              return CropPlotLine(cropLineNo: index);
            });
      }),
    );
  }
}
