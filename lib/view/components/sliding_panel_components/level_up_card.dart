// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/util/calc_funtions.dart';
import 'package:idle_game/util/constants.dart';

class LevelUpCard extends StatelessWidget {
  final int index;
  const LevelUpCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    CropController cropCon = CropController(context);
    CalcFunctions calcFuncs = CalcFunctions();
    UserStatsController userStatsCon = UserStatsController(context);
    bool isBuyable = userStatsCon.getCoinByType(false) >= calcFuncs.calcCropLevelUp(int.parse(cropCon.cropLevel(index)), KCrop.cropPrices[cropCon.cropByPlotId(index)]);

    return Card(
        color: Colors.amber,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: KSizer.panelListTileH,
          child: Row(
            children: [
              Card(
                child: SizedBox(
                  width: KSizer.panelCropImage,
                  child: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.asset(KCrop.cropImages[cropCon.cropByPlotId(index)], fit: BoxFit.cover)),
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    KCrop.cropNames[cropCon.cropByPlotId(index)],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS),
                  ),
                  Text(
                    "Level ${cropCon.cropLevel(index)}",
                    style: TextStyle(fontSize: KSizer.pointTextS),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  cropCon.addToInventory(index);
                  cropCon.deleteCrop(index);
                },
                icon: Image.asset(
                  KCrop.guiImages[0],
                  width: KSizer.setIconS,
                  fit: BoxFit.fitWidth,
                ),
              ),
              GestureDetector(
                child: Card(
                  color: isBuyable ? Colors.greenAccent : Colors.grey,
                  child: SizedBox(
                    width: KSizer.panelLevelUpCardW,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Upgrade", style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS)),
                        Text(calcFuncs.calcCropLevelUp(int.parse(cropCon.cropLevel(index)), KCrop.cropPrices[cropCon.cropByPlotId(index)]).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS)),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  if (isBuyable) {
                    cropCon.cropLevelUp(index, userStatsCon);
                  }
                },
              ),
            ],
          ),
        ));
  }
}
