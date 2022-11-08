// ignore_for_file: prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/model/user_shared_prefs.dart';
import 'package:idle_game/util/constants.dart';
import 'package:provider/provider.dart';

class CropPlot extends StatelessWidget {
  final int plotId;
  const CropPlot({Key? key, required this.plotId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserSimplePrefs, CropModel>(builder: (context, userModel, cropModel, child) {
      return GestureDetector(
        child: cropCardWidget(cropModel),
        onTap: () {
          print(plotId);
          print(cropModel.cropSize);

          if (cropModel.cropSize >= plotId) {
            //! böyle almak yerine crop modele bir değişken eklenebilir veya farklı şekillerde yapılabilir
            userModel.setCoin(KCrop.cropIncomes[cropModel.cropByPlotId(plotId)]);
            userModel.nextLvlCheck();
          } else if (cropModel.cropSize + 1 == plotId) {
            _showMaterialDialog(context, cropModel);
          }
        },
      );
    });
  }

  Widget cropCardWidget(CropModel cropModel) {
    return Card(
      color: cropModel.cropSize >= plotId ? Colors.purple : Colors.black,
      child: Container(),
    );
  }

  void _showMaterialDialog(BuildContext context, CropModel cropModel) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              backgroundColor: Colors.amber,
              title: Center(
                  child: Text(
                "ASD",
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    cropModel.addCrop(5);
                    if (cropModel.cropSize > cropModel.plotSize * 3 - 3) {
                      cropModel.addPlot();
                    }
                    Navigator.pop(context, true);
                  },
                  child: Text("Constants.PO", style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ],
            ),
          );
        });
  }
}
