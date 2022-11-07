// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:idle_game/model/shared_prefs.dart';

class User extends ChangeNotifier {
  late int _level;
  late int _xp;
  late int _nextlvlxp;
  late int _coin;
  late int _specialCoin;

  User() {
    _level = getLevel();
    _xp = getXp();
    _nextlvlxp = calcNextLvlXp();
    _coin = getCoin();
    _specialCoin = getSpecialCoin();
  }

  void setLevel() {
    UserSimplePrefs.setLevel();
    notifyListeners();
  }

  void setXp(int xp) {
    UserSimplePrefs.setXp(xp);
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

  int getXp() {
    _xp = UserSimplePrefs.getXp();
    return _xp;
  }

  int getCoin() {
    _coin = UserSimplePrefs.getCoin();
    return _coin;
  }

  int getSpecialCoin() {
    _specialCoin = UserSimplePrefs.getSpecialCoin();
    return _specialCoin;
  }

  int calcNextLvlXp() {
    return getLevel() * 10;
  }
}
