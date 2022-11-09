// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:idle_game/view/components/alert_dialog_components/choose_crop_card_widget.dart';
import 'package:provider/provider.dart';

class AlertDialogLayout extends StatelessWidget {
  const AlertDialogLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: AlertDialog(
        backgroundColor: Colors.amber,
        title: Consumer2<UserStatsModel, CropModel>(builder: (context, userModel, cropModel, child) {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              ChooseCropCardWidget(cropId: 0),
              ChooseCropCardWidget(cropId: 1),
              ChooseCropCardWidget(cropId: 2),
              ChooseCropCardWidget(cropId: 3),
              ChooseCropCardWidget(cropId: 4),
              ChooseCropCardWidget(cropId: 5),
              ChooseCropCardWidget(cropId: 6),
              ChooseCropCardWidget(cropId: 7),
              ChooseCropCardWidget(cropId: 8),
              ChooseCropCardWidget(cropId: 9),
            ],
          );
        }),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text("Close", style: TextStyle(color: Colors.black, fontSize: KSizer.textButtonSize)),
          ),
        ],
      ),
    );
  }
}
