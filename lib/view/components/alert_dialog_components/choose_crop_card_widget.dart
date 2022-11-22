import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/controller/user_stats_controller.dart';
import 'package:idle_game/util/calc_funtions.dart';
import 'package:idle_game/util/constants.dart';

class ChooseCropCardWidget extends StatelessWidget {
  final int cropId;
  const ChooseCropCardWidget({Key? key, required this.cropId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserStatsController userStatsCon = UserStatsController(context);
    CropController cropCon = CropController(context);
    CalcFunctions calcFuncs = CalcFunctions();
    bool isBuyable = userStatsCon.getCoinByType(false) >= calcFuncs.calcCropPrice(cropId, cropCon);

    return Card(
      color: Colors.brown,
      child: SizedBox(
        height: KSizer.panelListTileH,
        child: Row(
          children: [
            Card(
              child: SizedBox(
                width: KSizer.panelCropImage,
                child: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.asset(KCrop.cropImages[cropId], fit: BoxFit.contain)),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              KCrop.cropNames[cropId],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS),
            ),
            const Spacer(),
            GestureDetector(
              child: Card(
                color: isBuyable ? Colors.greenAccent : Colors.grey,
                child: SizedBox(
                  width: KSizer.panelLevelUpCardW * 0.7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Buy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS)),
                      Text(calcFuncs.calcMagnitude(calcFuncs.calcCropPrice(cropId, cropCon)),
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS)),
                    ],
                  ),
                ),
              ),
              onTap: () {
                if (isBuyable) {
                  cropCon.addCrop(cropId, 1, userStatsCon);
                  Navigator.pop(context, true);
                }
              },
            ),
            // IconButton(
            //   onPressed: () {
            //     if (isBuyable) {
            //       cropCon.addCrop(cropId, 1, userStatsCon);
            //       Navigator.pop(context, true);
            //     }
            //   },
            //   icon: Image.asset(
            //     KCrop.guiImages[1],
            //     width: KSizer.setIconS,
            //     fit: BoxFit.fitWidth,
            //   ),
            // )
          ],
        ),
      ),
    );

    // return GestureDetector(
    //   child: Card(
    //     child: Text(KCrop.cropNames[cropId]),
    //   ),
    //   onTap: () {
    //     if (isBuyable) {
    //       cropCon.addCrop(cropId, 1, userStatsCon);
    //       Navigator.pop(context, true);
    //     }
    //   },
    // );
  }
}
