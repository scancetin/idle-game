// ignore_for_file: unused_field, avoid_print
import 'package:flutter/material.dart';
import 'package:idle_game/model/shared_prefs.dart';

class User extends ChangeNotifier {
  late int _level;
  late int _coin;
  late int _specialCoin;

  User() {
    _level = getLevel();
    _coin = getCoin();
    _specialCoin = getSpecialCoin();
  }

  void setLevel() {
    UserSimplePrefs.setLevel();
    notifyListeners();
  }

  void setCoin(int coin) {
    UserSimplePrefs.setCoin(coin);
    notifyListeners();
  }

  void setSpecialCoin(int sCoin) {
    UserSimplePrefs.setSpecialCoin(sCoin);
    notifyListeners();
  }

  int getLevel() {
    _level = UserSimplePrefs.getLevel();
    return _level;
  }

  int getCoin() {
    _coin = UserSimplePrefs.getCoin();
    return _coin;
  }

  int getSpecialCoin() {
    _specialCoin = UserSimplePrefs.getSpecialCoin();
    return _specialCoin;
  }

  void nextLvlCheck() {
    print(_coin);
    if (_coin > calcNextLvl()) {
      print("asdsadsa");
      UserSimplePrefs.setLevel();
      _level = UserSimplePrefs.getLevel();
    }

    notifyListeners();
  }

  int calcNextLvl() {
    return _level * 10;
  }
}
