import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:steam_tweaks/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class ActionsPage extends StatefulWidget {
  const ActionsPage({super.key});

  static Widget buildIcon(BuildContext context) {
    return const Icon(YaruIcons.task_list);
  }

  static Widget buildTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return const Text(
      "Getting Started",
      maxLines: 2,
    );
  }

  static Widget buildDetail(BuildContext context) {
    return ActionsPage();
  }

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kYaruPagePadding),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Would you like to migrate your library?"),
                  ElevatedButton(
                    child: Text("Migrate"),
                    onPressed: () {
                      Process.run("./test.sh", []).then(
                        (value) {
                          final so = value.stdout;
                          print("Script output: $so");
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Select a GPU"),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text("Default"),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text("Intel"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("NVIDIA"),
                        value: 2,
                      )
                    ],
                    onChanged: (value) => {},
                  ),
                ],
              ),
              GamemodeWidget(),
              MangoWidget(),
              ProtonWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class ProtonWidget extends StatefulWidget {
  const ProtonWidget({
    super.key,
  });

  @override
  State<ProtonWidget> createState() => _ProtonWidgetState();
}

class _ProtonWidgetState extends State<ProtonWidget> {
  bool useProton = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {},
        ),
        Text("Enable Proton"),
        Switch(
          value: useProton,
          onChanged: (value) {
            print("Proton: $value");
            setState(() {
              useProton = value;
            });
          },
        )
      ],
    );
  }
}

class MangoWidget extends StatefulWidget {
  const MangoWidget({
    super.key,
  });

  @override
  State<MangoWidget> createState() => _MangoWidgetState();
}

class _MangoWidgetState extends State<MangoWidget> {
  bool useMango = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {},
        ),
        Text("Enable MangoHUD"),
        Switch(
          value: useMango,
          onChanged: (value) {
            print("Mangohud: $value");
            setState(() {
              useMango = value;
            });
          },
        ),
      ],
    );
  }
}

class GamemodeWidget extends StatefulWidget {
  const GamemodeWidget({
    super.key,
  });

  @override
  State<GamemodeWidget> createState() => _GamemodeWidgetState();
}

class _GamemodeWidgetState extends State<GamemodeWidget> {
  bool useGamemode = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () {},
        ),
        Text("Enable GameMode"),
        Switch(
          value: useGamemode,
          onChanged: (value) {
            // TODO: enable gamemode
            print("Gamemode: $value");
            setState(() {
              useGamemode = value;
            });
          },
        ),
      ],
    );
  }
}
