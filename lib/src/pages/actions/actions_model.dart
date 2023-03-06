import 'dart:io';

void migrate() {
  print("Migrating...");
  Process.run("\$SNAP/bin/steam-snap.sh", []).then((value) => {print("Migrated library.")});
}
