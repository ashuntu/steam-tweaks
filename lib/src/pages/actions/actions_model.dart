import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:steam_tweaks/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'actions_model.dart';

void migrate(BuildContext context, String method) async {
  final String steamGamesDirectory = "${Platform.environment['HOME']}/snap/steam/common/.local/share/Steam/steamapps/common";
  if(method == "copy"){
    print("Copied to snap!");
    //copy deb games [check if we only need to copy steamapps/common] to snap
  } else {
    final bool hasDownloadedGames = await Directory(steamGamesDirectory).exists();
    if(!hasDownloadedGames){
      //this is the idea, but not working
      //Process.run("\$SNAP/bin/steam-snap.sh", []).then((value) => {print("Linked library.")});
      print("This should link library!");
    } else {
      final bool? choice = await showAlertDialog(context);
      if(choice!=null && choice){
        //this is the idea, but not working
        //Directory("${Platform.environment['HOME']}/snap/steam/common/.local/share/Steam/steamapps").delete(recursive: true);
        //Process.run("\$SNAP/bin/steam-snap.sh", []).then((value) => {print("Linked library.")});
        print("You chose to delete your snap steam games and link the deb");
      }
    }
  }
}

Future <bool?> showAlertDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("You have downloaded games in the snap!"),
        content: const Text(
            "Migrating your library with the link method will delete your steam snap library. Are you sure you want to proceed?"),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context,rootNavigator:true).pop(false);
            },
          ),
          TextButton(
            child: const Text('Continue'),
            onPressed: () {
              Navigator.of(context,rootNavigator:true).pop(true);
            },
          )
        ],
      );
    },
  );
}