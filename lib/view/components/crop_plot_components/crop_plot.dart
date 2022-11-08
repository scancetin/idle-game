// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:provider/provider.dart';

class CropPlot extends StatelessWidget {
  final int plotId;
  const CropPlot({Key? key, required this.plotId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserStatsController userStatsCon = UserStatsController(context);
    CropController cropCon = CropController(context);

    return Consumer2<UserStatsModel, CropModel>(builder: (context, userModel, cropModel, child) {
      return GestureDetector(
        child: cropCardWidget(cropCon),
        onTap: () {
          cropCon.onCropClick(userStatsCon, plotId, false) ? _showMaterialDialog(context, cropCon) : null;
        },
      );
    });
  }

  Widget cropCardWidget(CropController cropCon) {
    return Card(
      color: cropCon.cropSize() > plotId ? Colors.purple : Colors.black,
      child: Container(),
    );
  }

  void _showMaterialDialog(BuildContext context, CropController cropCon) {
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
                    cropCon.addCropOrPlot(4);
                    Navigator.pop(context, true);
                  },
                  child: Text("Add Crop", style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ],
            ),
          );
        });
  }
}
