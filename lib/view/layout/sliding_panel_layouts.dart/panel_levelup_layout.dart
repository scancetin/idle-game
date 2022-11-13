// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/calc_funtions.dart';
import 'package:idle_game/util/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PanelLevelUpLayout extends StatelessWidget {
  const PanelLevelUpLayout({super.key});

  @override
  Widget build(BuildContext context) {
    CropController cropCon = CropController(context);
    UserStatsController userStatsCon = UserStatsController(context);
    CalcFunctions calcFuncs = CalcFunctions();

    return Container(
      height: KSizer.panelLevelUpH,
      color: Colors.red,
      child: Consumer<CropModel>(builder: (context, cropModel, child) {
        return ListView.builder(
          itemCount: cropCon.cropSize(),
          itemBuilder: (context, index) {
            bool isBuyable = userStatsCon.getCoinByType(false) >= calcFuncs.calcCropLevelUp(int.parse(cropCon.cropLevel(index)), KCrop.cropPrices[cropCon.cropByPlotId(index)]);

            return Card(
                child: Container(
              height: 50,
              color: Colors.amber,
              child: Row(
                children: [
                  Text(KCrop.cropNames[cropCon.cropByPlotId(index)]),
                  Spacer(),
                  Text(cropCon.cropLevel(index)),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      if (isBuyable) {
                        cropCon.cropLevelUp(index, userStatsCon);
                      }
                    },
                    icon: Icon(Icons.plus_one),
                  ),
                  IconButton(
                      onPressed: () {
                        cropCon.addToInventory(index);
                        cropCon.deleteCrop(index);
                      },
                      icon: Icon(Icons.inventory)),
                ],
              ),
            ));
          },
        );
      }),
    );
  }
}
