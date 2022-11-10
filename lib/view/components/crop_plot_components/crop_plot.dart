// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:idle_game/view/layout/alert_dialog_layout.dart';
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
          cropCon.onCropClick(userStatsCon, plotId, false) ? _showMaterialDialog(context) : null;
        },
      );
    });
  }

  Widget cropCardWidget(CropController cropCon) {
    return Card(
      color: cropCon.cropSize() > plotId ? Colors.purple : Colors.black,
      child: SizedBox(
        height: KSizer.cropPlotSize,
        width: KSizer.cropPlotSize,
        child: cropCon.cropSize() > plotId
            ? Text(KCrop.cropNames[cropCon.cropByPlotId(plotId)])
            : cropCon.cropSize() == plotId
                ? Icon(Icons.add, size: KSizer.cropAddIcon)
                : null,
      ),
    );
  }

  void _showMaterialDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialogLayout();
        });
  }
}
