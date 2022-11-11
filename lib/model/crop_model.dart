// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CropModel extends ChangeNotifier {
  static late SharedPreferences _prefs;
  static const String _plotSize = "plotSize";
  static const String _cropSize = "cropSize";
  static const String _currentPlot = "cPlot";

  static const String _cropsById = "cropsById";
  static const String _cropsLevel = "cropsLevel";

  static const String _inventoryCrop = "invCrop";
  static const String _inventoryLevel = "invLevel";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  int get plotSize => _prefs.getInt(_plotSize) ?? 4;
  int get cropSize => _prefs.getInt(_cropSize) ?? 0;
  int get currentPlot => _prefs.getInt(_currentPlot) ?? 0;

  List<String> get cropsById => _prefs.getStringList(_cropsById) ?? [];
  List<String> get cropsLevel => _prefs.getStringList(_cropsLevel) ?? [];

  List<String> get invCrop => _prefs.getStringList(_inventoryCrop) ?? [];
  List<String> get invLevel => _prefs.getStringList(_inventoryLevel) ?? [];
  int? get invSize => _prefs.getStringList(_inventoryCrop)?.length;

  Future addPlot() async {
    await _prefs.setInt(_plotSize, plotSize + 4);
    notifyListeners();
  }

  // Future deletePlot() async {
  //   await _prefs.setInt(_plotSize, plotSize - 1);
  // }

  Future changeCurrentPlot(int newPlot) async {
    await _prefs.setInt(_currentPlot, newPlot);
  }

  Future addCrop(int cropId, int level) async {
    await _prefs.setStringList(_cropsById, cropsById + [cropId.toString()]);
    await _prefs.setStringList(_cropsLevel, cropsLevel + [level.toString()]);
    await _prefs.setInt(_cropSize, cropSize + 1);

    if (cropSize % 12 == 0 && cropSize == plotSize * 3) addPlot();

    notifyListeners();
  }

  Future deleteCrop(int cropIndex) async {
    List<String> newCropList = cropsById;
    List<String> newLevelList = cropsLevel;
    newCropList.removeAt(cropIndex);
    newLevelList.removeAt(cropIndex);

    await _prefs.setStringList(_cropsById, newCropList);
    await _prefs.setStringList(_cropsLevel, newLevelList);
    await _prefs.setInt(_cropSize, cropSize - 1);

    // if (cropSize % 3 == 2 && plotSize > 4) deletePlot();

    notifyListeners();
  }

  Future cropLevelUp(int cropIndex) async {
    List<String> newList = cropsLevel;
    newList[cropIndex] = (int.parse(cropsLevel[cropIndex]) + 1).toString();
    await _prefs.setStringList(_cropsLevel, newList);
    notifyListeners();
  }

  Future addToInventory(int cropId) async {
    await _prefs.setStringList(_inventoryCrop, invCrop + [cropsById[cropId]]);
    await _prefs.setStringList(_inventoryLevel, invLevel + [cropsLevel[cropId]]);
    notifyListeners();
  }

  Future deleteFromInventory(int cropIndex) async {
    List<String> newCropList = invCrop;
    List<String> newLevelList = invLevel;
    newCropList.removeAt(cropIndex);
    newLevelList.removeAt(cropIndex);

    addCrop(int.parse(invCrop[cropIndex]), int.parse(invLevel[cropIndex]));
    await _prefs.setStringList(_inventoryCrop, newCropList);
    await _prefs.setStringList(_inventoryLevel, newLevelList);
    notifyListeners();
  }

  Future restartCrops() async {
    _prefs.clear();
    notifyListeners();
  }
}
