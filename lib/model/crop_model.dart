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
  int get cropSize => _prefs.getInt(_cropSize) ?? 0;
  List<String> get cropsById => _prefs.getStringList(_cropsById) ?? [];
  int cropByPlotId(int plotId) => int.parse(cropsById[plotId]);

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
    await _prefs.setStringList(_cropsById, []);
    await _prefs.setInt(_cropSize, 0);
    await _prefs.setInt(_plotSize, 4);
    notifyListeners();
  }
}
