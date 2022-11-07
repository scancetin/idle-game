// ignore_for_file: unused_field

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePrefs {
  static late SharedPreferences _prefs;
  static const String _level = "level";
  static const String _xp = "xp";
  static const String _coin = "coin";
  static const String _specialCoin = "sCoin";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int getLevel() => _prefs.getInt(_level) ?? 1;
  static int getXp() => _prefs.getInt(_xp) ?? 0;
  static int getCoin() => _prefs.getInt(_coin) ?? 0;
  static int getSpecialCoin() => _prefs.getInt(_specialCoin) ?? 0;

  static Future setLevel() async {
    await _prefs.setInt(_level, getLevel() + 1);
  }

  static Future setXp(int xp) async {
    await _prefs.setInt(_xp, getXp() + xp);
  }

  static Future setCoin(int coin) async {
    await _prefs.setInt(_coin, getCoin() + coin);
  }

  static Future setSpecialCoin(int sCoin) async {
    await _prefs.setInt(_specialCoin, getSpecialCoin() + sCoin);
  }
}
