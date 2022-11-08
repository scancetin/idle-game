// ignore_for_file: avoid_print, unused_field

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CropModel extends ChangeNotifier {
  static late SharedPreferences _prefs;
  static const String _plotSize = "plotSize";
  static const String _cropSize = "cropSize";
  static const String _cropsById = "cropsById";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get plotSize => _prefs.getInt(_plotSize) ?? 4;
  int get cropSize => _prefs.getInt(_cropSize) ?? 1;
  List<String> get cropsById => _prefs.getStringList(_cropsById) ?? ["0"];
  int cropByPlotId(int plotId) => int.parse(cropsById[plotId - 1]);

  Future addCrop(int cropId) async {
    List<String> newList = cropsById;
    newList.add(cropId.toString());
    await _prefs.setStringList(_cropsById, newList);
    await _prefs.setInt(_cropSize, cropSize + 1);
    notifyListeners();
  }

  Future addPlot() async {
    await _prefs.setInt(_plotSize, plotSize + 1);
    notifyListeners();
  }

  Future restartCrops() async {
    await _prefs.setStringList(_cropsById, ["0"]);
    await _prefs.setInt(_cropSize, 1);
    await _prefs.setInt(_plotSize, 4);
    notifyListeners();
  }
  // late int _plotSize;
  // late int _cropSize;
  // late List<int> _cropsById;

  // CropModel() {
  //   _plotSize = 4;
  //   _cropSize = 1;
  //   _cropsById = [0];
  // }

  // int get plotSize => _plotSize;
  // int get cropSize => _cropSize;
  // List<int> get cropsById => _cropsById;
  // int cropByPlotId(int plotId) => _cropsById[plotId - 1];

  // void addCrop(int cropId) {
  //   _cropsById.add(cropId);
  //   _cropSize++;
  //   print(_cropsById);
  //   notifyListeners();
  // }

  // void addPlot() {
  //   _plotSize += 1;
  //   notifyListeners();
  // }
}
