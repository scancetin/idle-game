// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePrefs extends ChangeNotifier {
  static late SharedPreferences _prefs;
  static const String _level = "level";
  static const String _coin = "coin";
  static const String _specialCoin = "sCoin";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int getLevel() => _prefs.getInt(_level) ?? 1;
  int getCoin() => _prefs.getInt(_coin) ?? 0;
  int getSpecialCoin() => _prefs.getInt(_specialCoin) ?? 0;

  Future setLevel() async {
    await _prefs.setInt(_level, getLevel() + 1);
    notifyListeners();
  }

  Future setCoin(int coin) async {
    await _prefs.setInt(_coin, getCoin() + coin);
    notifyListeners();
  }

  Future setSpecialCoin(int sCoin) async {
    await _prefs.setInt(_specialCoin, getSpecialCoin() + sCoin);
    notifyListeners();
  }

  void nextLvlCheck() {
    // print(getCoin());
    if (getCoin() > calcNextLvl()) {
      setLevel();
    }

    notifyListeners();
  }

  int calcNextLvl() {
    return getLevel() * 10;
  }

  Future restartStats() async {
    await _prefs.setInt(_level, 1);
    await _prefs.setInt(_coin, 0);
    await _prefs.setInt(_specialCoin, 0);

    notifyListeners();
  }
}
