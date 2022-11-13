// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:idle_game/controller/crop_controller.dart';
import 'package:idle_game/util/constants.dart';
import 'package:sizer/sizer.dart';

class InventoryCard extends StatelessWidget {
  final int index;
  const InventoryCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    CropController cropCon = CropController(context);

    return Card(
        color: Colors.amber,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: KSizer.panelListTileH,
          child: Row(
            children: [
              Card(
                child: SizedBox(
                  width: KSizer.panelCropImage,
                  child: Image.network("https://i.redd.it/vhdhdicjtvq41.jpg", fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 10),
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
              Spacer(),
              IconButton(
                  onPressed: () {
                    cropCon.deleteFromInventory(index);
                  },
                  icon: Icon(
                    Icons.upcoming,
                    size: KSizer.setIconS,
                  )),
            ],
          ),
        ));
  }
}
