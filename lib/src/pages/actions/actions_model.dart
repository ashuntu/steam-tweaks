import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

import 'package:vdf/vdf.dart';

void migrate() {
  print("Migrating...");
  Process.run("\$SNAP/bin/steam-snap.sh", []).then((value) => {print("Migrated library.")});
}

/// Removes repeated spaces, trims, and adds "%command%" to the end
String normalizeLaunchOptions(String launchOptions) {
  if (!launchOptions.endsWith("%command%")) {
    launchOptions += " %command%";
  }
  return launchOptions.replaceAll(RegExp(r" {2,}"), " ").trim();
}

/// Prepends options to each game's launch options if not already present
void addLaunchOptions(List<String> options) {
  final dir = Directory("${Platform.environment['HOME']}/snap/steam/common/.steam/steam/userdata/");
  final users = dir.listSync();

  // sets config for every Steam user
  for (final user in users) {
    final file = File("${user.path}/config/localconfig.vdf");
    final config = vdfDecode(file.readAsStringSync());
    final Map games = config["UserLocalConfigStore"]["Software"]["Valve"]["Steam"]["apps"];

    for (final game in games.keys) {
      for (final option in options) {
        if (!games[game]["LaunchOptions"].contains(option)) {
          games[game]["LaunchOptions"] = '$option ${games[game]["LaunchOptions"]}';
        }
        games[game]["LaunchOptions"] = normalizeLaunchOptions(games[game]["LaunchOptions"]);
      }
    }

    file.writeAsStringSync(vdfEncode(config));
  }
}

/// Removes options from each game's launch options
void removeLaunchOptions(List<String> options) {
  final dir = Directory("${Platform.environment['HOME']}/snap/steam/common/.steam/steam/userdata/");
  final users = dir.listSync();

  for (final user in users) {
    final file = File("${user.path}/config/localconfig.vdf");
    final config = vdfDecode(file.readAsStringSync());
    final Map games = config["UserLocalConfigStore"]["Software"]["Valve"]["Steam"]["apps"];

    for (final game in games.keys) {
      for (final option in options) {
        games[game]["LaunchOptions"] = games[game]["LaunchOptions"].replaceAll(option, "");
        games[game]["LaunchOptions"] = normalizeLaunchOptions(games[game]["LaunchOptions"]);
      }
    }

    file.writeAsStringSync(vdfEncode(config));
  }
}

/// Enables/disabled Proton Experimental for unsupported titles
void extendedProton(bool enable) {
  final file =
      File("${Platform.environment['HOME']}/snap/steam/common/.steam/steam/config/config.vdf");
  final config = vdfDecode(file.readAsStringSync());

  config["InstallConfigStore"]["Software"]["Valve"]["Steam"]["CompatToolMapping"]["0"] = {
    "name": enable ? "proton_experimental" : "",
    "config": "",
    "priority": "75",
  };

  file.writeAsStringSync(vdfEncode(config));
}
