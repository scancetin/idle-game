// ignore_for_file: avoid_print

import 'package:idle_game/controller/crop_controller.dart';
import 'constants.dart';

class CalcFunctions {
  int incomePerSecond(CropController cropCon) {
    int i = 0;
    int revForSec = 0;

    while (i < cropCon.cropSize()) {
      revForSec += calcCropIncome(KCrop.cropIncomes[cropCon.cropByPlotId(i)], cropCon.cropLevel(i));
      i++;
    }
    return revForSec;
  }

  //! write function for cropIncome - cropLevel
  int calcCropIncome(int cropIncome, String cropLevel) {
    return cropIncome;
  }

  //! write functon for cropPrice - cropSize
  int calcCropPrice(int cropPrice, int cropSize, int? invSize) {
    return cropPrice;
  }

  //! write function for level-xp
  int calcLevel(int xp, int level) {
    return xp ~/ 10;
  }

  int calcCropLevelUp(int cropLevel, int cropPrice) {
    return cropPrice;
  }
}
