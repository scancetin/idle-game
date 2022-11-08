import 'package:flutter/cupertino.dart';
import 'package:idle_game/model/user_stats_model.dart';
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

  //! write function for level-xp
  int calcLevel() {
    return userModel.getXp() ~/ 10;
  }

  void restartGame() {
    userModel.restartStats();
  }
}
