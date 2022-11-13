// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:provider/provider.dart';

import '../util/calc_funtions.dart';

class UserStatsController {
  late UserStatsModel userModel;
  final CalcFunctions calcFuncs = CalcFunctions();

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

  void setCoin(int coin) {
    userModel.setCoin(coin);
  }

  void setXp(int xp) {
    print(xp);
    userModel.setXp(xp);
    userModel.setLevel(calcFuncs.calcLevel(userModel.getXp(), userModel.getLevel()));
  }

  void idleIncome(CropController cropCon) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setCoin(calcFuncs.incomePerSecond(cropCon));
      // print(calcFuncs.incomePerSecond(cropCon));
    });
  }

  void restartGame() {
    userModel.restartStats();
  }
}
