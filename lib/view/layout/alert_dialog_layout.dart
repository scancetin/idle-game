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
          return SizedBox(
            height: KSizer.alertDialogH,
            width: KSizer.alertDialogW,
            child: ListView.builder(
              itemCount: KCrop.cropIds.length,
              itemBuilder: (context, index) {
                return ChooseCropCardWidget(cropId: index);
              },
            ),
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
