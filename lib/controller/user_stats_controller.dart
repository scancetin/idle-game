// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:provider/provider.dart';

class UserStatsController {
  late UserStatsModel userModel;

  //!!! consumer olmadan refreshleme işlemi nasıl yapılıyor ???

  UserStatsController(BuildContext context) {
    userModel = Provider.of<UserStatsModel>(context, listen: false);
  }

  int getLevel() {
    return userModel.getLevel();
  }

  int getCoinByType(bool isSpecialCoin) {
    return isSpecialCoin ? userModel.getSpecialCoin() : userModel.getCoin();
  }

  void setCoinByType(bool isSpecialCoin, int coin) {
    isSpecialCoin ? userModel.setSpecialCoin(coin) : userModel.setCoin(coin);
  }

  void setXp(int xp) {
    userModel.setXp(xp);
    userModel.setLevel(calcLevel());
  }

  void idleIncome(CropController cropCon) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setCoinByType(false, incomePerSecond(cropCon));
      print(incomePerSecond(cropCon));
    });
  }

  int incomePerSecond(CropController cropCon) {
    int i = 0;
    int revForSec = 0;

    while (i < cropCon.cropSize()) {
      revForSec += calcCropIncome(KCrop.cropIncomes[cropCon.cropByPlotId(i)], int.parse(cropCon.cropLevel(i)));
      i++;
    }
    return revForSec;
  }

  //! listView ile sonsuz tarla yapmak yerine 12 slotluk sonsuz tarla yapmak daha mantıklı,
  //! bunun için plotSize'ı tarla adeti olarak kullanıp, sağa ve sola birer geçiş butonu koyabiliriz.
  //! mantıksal işlemler için -> listView buildera cropSize yerine 12 verilir,

  //!!! functions for game - create class for functions, this will be complex
  //! write function for level-xp
  int calcLevel() {
    return userModel.getXp() ~/ 10;
  }

  //! write function for cropIncome - level
  int calcCropIncome(int cropIncome, int cropLevel) {
    return cropIncome;
  }

  int calcCropPrice(int cropPrice, int cropSize, int plotSize) {
    return 0;
  }

  void restartGame() {
    userModel.restartStats();
  }
}
