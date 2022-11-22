import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'constants.dart';
import 'dart:math';

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

  String calcMagnitude(int coin) {
    List<int> formatList = [];
    int magCounter = (coin.toString().length / 3).ceil();
    int number = 0;

    while (magCounter > 0) {
      number = coin ~/ pow(1000, magCounter - 1);
      coin -= number * pow(1000, magCounter - 1).toInt();
      formatList.add(number);
      magCounter--;
    }

    // print(formatList.reversed.toList());
    return calcNumberFormat(formatList.reversed.toList());
    // return formatList.reversed.toList();
  }

  String calcNumberFormat(List<int> magList) {
    List<String> formattedList = [];
    magList.asMap().forEach((i, v) => formattedList.add("$v${KCrop.numberFormat[i]}"));
    // print(formattedList);
    return formattedList[formattedList.length - 1];
  }

  //! write function for cropIncome - cropLevel
  int calcCropIncome(int cropIncome, String cropLevel) {
    return cropIncome;
  }

  //! write functon for cropPrice - cropSize
  int calcCropPrice(int cropId, CropController cropCon) {
    // KCrop.cropPrices[cropId];
    // cropCon.cropSize();
    // cropCon.invSize();
    return KCrop.cropPrices[cropId];
  }

  //! write function for level-xp
  int calcLevel(UserStatsController userStatsCon) {
    // userStatsCon.getLevel();
    // userStatsCon.getXp();
    return userStatsCon.getXp() ~/ 10;
  }

  int calcCropLevelUp(int cropLevel, int cropPrice) {
    return cropPrice;
  }
}
