// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, prefer_interpolation_to_compose_strings

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
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return CropPlotLine(cropLineNo: index, currentPlot: cropCon.currentPlot());
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      if (cropCon.currentPlot() > 0) {
                        cropCon.changeCurrentPlot(cropCon.currentPlot() - 1);
                      }
                      print("left: " + cropCon.currentPlot().toString());
                    },
                    icon: Icon(Icons.turn_left),
                    iconSize: KSizer.setIconS * 2),
                IconButton(
                    onPressed: () {
                      if (cropCon.currentPlot() < cropCon.plotSize() / 4) {
                        cropCon.changeCurrentPlot(cropCon.currentPlot() + 1);
                      }
                      print("right: " + cropCon.currentPlot().toString());
                      print("plotsize: " + cropCon.plotSize().toString());
                    },
                    icon: Icon(Icons.turn_right),
                    iconSize: KSizer.setIconS * 2),
              ],
            )
          ],
        );
      }),
    );
  }
}
