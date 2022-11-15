import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/util/calc_funtions.dart';
import 'package:idle_game/util/constants.dart';

class PowerUpsCard extends StatelessWidget {
  final int index;
  const PowerUpsCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // CropController cropCon = CropController(context);
    // CalcFunctions calcFuncs = CalcFunctions();
    UserStatsController userStatsCon = UserStatsController(context);
    bool isBuyable = userStatsCon.getCoinByType(false) >= KCrop.powerupsPrices[index];

    return Card(
      color: Colors.amber,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: KSizer.panelListTileH,
        child: Row(
          children: [
            Card(
              child: SizedBox(
                width: KSizer.panelCropImage,
                child: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.asset(KCrop.powerupsImages[index], fit: BoxFit.contain)),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  KCrop.powerupsNames[index],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS),
                ),
                Text(
                  "Power-Up detail",
                  style: TextStyle(fontSize: KSizer.pointTextS),
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              child: Card(
                color: isBuyable ? Colors.greenAccent : Colors.grey,
                child: SizedBox(
                  width: KSizer.panelLevelUpCardW,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Buy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS)),
                      Text(KCrop.powerupsPrices[index].toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS)),
                    ],
                  ),
                ),
              ),
              onTap: () {
                if (isBuyable) {
                  // power-up functions
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
