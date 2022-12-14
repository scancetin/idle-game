import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/model/user_stats_model.dart';
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

  int getXp() {
    return userModel.getXp();
  }

  void setCoin(int coin) {
    userModel.setCoin(coin);
  }

  void setXp(int xp) {
    userModel.setXp(xp);
    userModel.setLevel(calcFuncs.calcLevel(this));
  }

  void idleIncome(CropController cropCon) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setCoin(calcFuncs.incomePerSecond(cropCon));
    });
  }

  void restartGame() {
    userModel.restartStats();
  }
}
