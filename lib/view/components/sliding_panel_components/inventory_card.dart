import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/util/constants.dart';

class InventoryCard extends StatelessWidget {
  final int index;
  const InventoryCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    CropController cropCon = CropController(context);

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
                child: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.asset(KCrop.cropImages[cropCon.invCrop(index)], fit: BoxFit.contain)),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  KCrop.cropNames[cropCon.invCrop(index)],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: KSizer.pointTextS),
                ),
                Text("Level ${cropCon.invLevel(index)}", style: TextStyle(fontSize: KSizer.pointTextS)),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                cropCon.deleteFromInventory(index);
              },
              icon: Image.asset(
                KCrop.guiImages[1],
                width: KSizer.setIconS,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
