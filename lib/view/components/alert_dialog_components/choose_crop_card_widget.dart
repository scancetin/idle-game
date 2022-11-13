import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/util/calc_funtions.dart';
import 'package:idle_game/util/constants.dart';

class ChooseCropCardWidget extends StatelessWidget {
  final int cropId;
  const ChooseCropCardWidget({Key? key, required this.cropId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserStatsController userStatsCon = UserStatsController(context);
    CropController cropCon = CropController(context);
    CalcFunctions calcFuncs = CalcFunctions();
    bool isBuyable = userStatsCon.getCoinByType(false) >= calcFuncs.calcCropPrice(KCrop.cropPrices[cropId], cropCon.cropSize(), cropCon.invSize());

    return GestureDetector(
      child: Card(
        child: Text(KCrop.cropNames[cropId]),
      ),
      onTap: () {
        if (isBuyable) {
          cropCon.addCrop(cropId, 1, userStatsCon);
          Navigator.pop(context, true);
        }
      },
    );
  }
}
