import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStatsModel extends ChangeNotifier {
  static late SharedPreferences _prefs;
  static const String _level = "level";
  static const String _coin = "coin";
  static const String _xp = "xp";
  static const String _specialCoin = "sCoin";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int getLevel() => _prefs.getInt(_level) ?? 1;
  int getCoin() => _prefs.getInt(_coin) ?? 100;
  int getXp() => _prefs.getInt(_xp) ?? 10;
  int getSpecialCoin() => _prefs.getInt(_specialCoin) ?? 0;

  Future setLevel(int level) async {
    await _prefs.setInt(_level, level);
    notifyListeners();
  }

  Future setCoin(int coin) async {
    await _prefs.setInt(_coin, getCoin() + coin);
    notifyListeners();
  }

  Future setXp(int xp) async {
    await _prefs.setInt(_xp, getXp() + xp);
    notifyListeners();
  }

  Future setSpecialCoin(int sCoin) async {
    await _prefs.setInt(_specialCoin, getSpecialCoin() + sCoin);
    notifyListeners();
  }

  Future restartStats() async {
    await _prefs.setInt(_level, 1);
    await _prefs.setInt(_coin, 100);
    await _prefs.setInt(_specialCoin, 0);
    await _prefs.setInt(_xp, 10);
    notifyListeners();
  }
}
