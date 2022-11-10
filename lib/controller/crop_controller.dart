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

  String cropLevel(int cropIndex) {
    return cropModel.cropsLevel[cropIndex];
  }

  int invCrop(int cropIndex) {
    return int.parse(cropModel.invCrop[cropIndex]);
  }

  String invLevel(int cropIndex) {
    return cropModel.invLevel[cropIndex];
  }

  int? invSize() {
    return cropModel.invSize;
  }

  void addCrop(int cropId, int level, bool isSpecialCoin, UserStatsController userStatsCon) {
    cropModel.addCrop(cropId, level);
    userStatsCon.setCoinByType(isSpecialCoin, -KCrop.cropPrices[cropId]);
  }

  void deleteCrop(int cropIndex) {
    cropModel.deleteCrop(cropIndex);
  }

  void deleteFromInventory(int cropIndex) {
    cropModel.deleteFromInventory(cropIndex);
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

  void cropLevelUp(int cropIndex) {
    cropModel.cropLevelUp(cropIndex);
  }

  void addToInventory(int cropIndex) {
    cropModel.addToInventory(cropIndex);
  }

  void restartGame() {
    cropModel.restartCrops();
  }
}
