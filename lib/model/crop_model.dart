import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CropModel extends ChangeNotifier {
  static late SharedPreferences _prefs;
  static const String _plotSize = "plotSize";
  static const String _cropSize = "cropSize";
  static const String _cropsById = "cropsById";
  static const String _cropsLevel = "cropsLevel";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get plotSize => _prefs.getInt(_plotSize) ?? 4;
  int get cropSize => _prefs.getInt(_cropSize) ?? 0;
  List<String> get cropsById => _prefs.getStringList(_cropsById) ?? [];
  List<String> get cropsLevel => _prefs.getStringList(_cropsLevel) ?? [];
  int cropByPlotId(int plotId) => int.parse(cropsById[plotId]);

  Future addCrop(int cropId) async {
    // List<String> newCropList = cropsById;
    // newCropList.add(cropId.toString());
    await _prefs.setStringList(_cropsById, cropsById + [cropId.toString()]);
    await _prefs.setStringList(_cropsLevel, cropsLevel + ["1"]);
    await _prefs.setInt(_cropSize, cropSize + 1);
    notifyListeners();
  }

  Future addPlot() async {
    await _prefs.setInt(_plotSize, plotSize + 1);
    notifyListeners();
  }

  Future cropLevelUp(int cropIndex) async {
    List<String> newList = cropsLevel;
    newList[cropIndex] = (int.parse(cropsLevel[cropIndex]) + 1).toString();
    await _prefs.setStringList(_cropsLevel, newList);
    notifyListeners();
  }

  Future restartCrops() async {
    await _prefs.setInt(_cropSize, 0);
    await _prefs.setInt(_plotSize, 4);
    await _prefs.setStringList(_cropsById, []);
    await _prefs.setStringList(_cropsLevel, []);
    notifyListeners();
  }
}
