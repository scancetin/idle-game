import 'package:flutter/cupertino.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/util/calc_funtions.dart';
import 'package:provider/provider.dart';
import '../util/constants.dart';

class CropController {
  late CropModel cropModel;
  final CalcFunctions calcFuncs = CalcFunctions();

  CropController(BuildContext context) {
    cropModel = Provider.of<CropModel>(context, listen: false);
  }

  int plotSize() {
    return cropModel.plotSize;
  }

  int currentPlot() {
    return cropModel.currentPlot;
  }

  int cropSize() {
    return cropModel.cropSize;
  }

  int cropByPlotId(int plotId) {
    return int.parse(cropModel.cropsById[plotId]);
  }

  String cropLevel(int cropIndex) {
    return cropModel.cropsLevel[cropIndex];
  }

  int? invSize() {
    return cropModel.invSize;
  }

  int invCrop(int cropIndex) {
    return int.parse(cropModel.invCrop[cropIndex]);
  }

  String invLevel(int cropIndex) {
    return cropModel.invLevel[cropIndex];
  }

  void addCrop(int cropId, int level, UserStatsController userStatsCon) {
    cropModel.addCrop(cropId, level);
    userStatsCon.setCoin(-calcFuncs.calcCropPrice(KCrop.cropPrices[cropId], cropModel.cropSize, cropModel.invSize));
  }

  void cropLevelUp(int cropIndex, UserStatsController userStatsCon) {
    cropModel.cropLevelUp(cropIndex);
    userStatsCon.setCoin(-calcFuncs.calcCropLevelUp(int.parse(cropModel.cropsLevel[cropIndex]), KCrop.cropPrices[cropByPlotId(cropIndex)]));
  }

  void deleteCrop(int cropIndex) {
    cropModel.deleteCrop(cropIndex);
  }

  void changeCurrentPlot(int newPlot) {
    cropModel.changeCurrentPlot(newPlot);
  }

  void addToInventory(int cropIndex) {
    cropModel.addToInventory(cropIndex);
  }

  void deleteFromInventory(int cropIndex) {
    cropModel.deleteFromInventory(cropIndex);
  }

  bool onCropClick(UserStatsController userStatsCon, int plotId) {
    if (cropSize() > plotId) {
      int cropIncome = calcFuncs.calcCropIncome(KCrop.cropIncomes[cropByPlotId(plotId)], cropModel.cropsLevel[plotId]);
      userStatsCon.setCoin(cropIncome);
      userStatsCon.setXp(KCrop.cropIncomes[cropByPlotId(plotId)]);
    } else if (cropSize() == plotId) {
      return true;
    }
    return false;
  }

  void restartGame() {
    cropModel.restartCrops();
  }
}
