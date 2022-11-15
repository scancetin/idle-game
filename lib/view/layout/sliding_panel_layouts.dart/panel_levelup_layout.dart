import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:idle_game/view/components/sliding_panel_components/level_up_card.dart';
import 'package:provider/provider.dart';

class PanelLevelUpLayout extends StatelessWidget {
  const PanelLevelUpLayout({super.key});

  @override
  Widget build(BuildContext context) {
    CropController cropCon = CropController(context);

    return Container(
      height: KSizer.panelLevelUpH,
      color: Colors.red,
      child: Consumer2<UserStatsModel, CropModel>(builder: (context, userModel, cropModel, child) {
        return ListView.builder(
          itemCount: cropCon.cropSize(),
          itemBuilder: (context, index) {
            return LevelUpCard(index: index);
          },
        );
      }),
    );
  }
}
