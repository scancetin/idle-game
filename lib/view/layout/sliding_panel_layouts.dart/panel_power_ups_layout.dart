import 'package:flutter/material.dart';
import 'package:idle_game/model/crop_model.dart';
import 'package:idle_game/model/user_stats_model.dart';
import 'package:idle_game/util/constants.dart';
import 'package:idle_game/view/components/sliding_panel_components/powerups_card.dart';
import 'package:provider/provider.dart';

class PanelPowerUpsLayout extends StatelessWidget {
  const PanelPowerUpsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: KSizer.panelLevelUpH,
      color: Colors.red,
      child: Consumer2<UserStatsModel, CropModel>(builder: (context, userModel, cropModel, child) {
        return ListView.builder(
          itemCount: KCrop.powerupsImages.length,
          itemBuilder: (context, index) {
            return PowerUpsCard(index: index);
          },
        );
      }),
    );
  }
}
