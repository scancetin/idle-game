import 'package:flutter/cupertino.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:provider/provider.dart';

import '../util/constants.dart';

class CropController {
  late CropModel cropModel;

  CropController(BuildContext context) {
    cropModel = Provider.of<CropModel>(context, listen: false);
  }

  int plotSize() {
    return cropModel.plotSize;
  }

  int cropSize() {
    return cropModel.cropSize;
  }

  int cropByPlotId(int plotId) {
    return cropModel.cropByPlotId(plotId);
  }

  void addCropOrPlot(int cropId, bool isSpecialCoin,UserStatsController userStatsCon) {
    cropModel.addCrop(cropId);
    userStatsCon.setCoinByType(isSpecialCoin, -KCrop.cropPrices[cropId]);
    if (cropModel.cropSize > cropModel.plotSize * 3 - 3) {
      cropModel.addPlot();
    }
  }

  bool onCropClick(UserStatsController userStatsCon, int plotId, bool isSpecialCoin) {
    if (cropSize() > plotId) {
      int cropIncome = KCrop.cropIncomes[cropByPlotId(plotId)];
      userStatsCon.setCoinByType(isSpecialCoin, cropIncome);
      userStatsCon.setXp(cropIncome);
    } else if (cropSize() == plotId) {
      return true;
    }
    return false;
  }

  void restartGame() {
    cropModel.restartCrops();
  }
}
