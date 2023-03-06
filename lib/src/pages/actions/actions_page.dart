import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:steam_tweaks/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'actions_model.dart';

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
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Would you like to migrate your library?"),
                  Column(
                    children: [
                      ElevatedButton(
                        child: const Text("Migrate (copy)"),
                        onPressed: () {
                          migrate();
                        },
                      ),
                      ElevatedButton(
                        child: const Text("Migrate (link)"),
                        onPressed: () {
                          migrate();
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const GPUWidget(),
              const Spacer(),
              const GamemodeWidget(),
              const MangoWidget(),
              const ProtonWidget(),
              const Spacer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

class GPUWidget extends StatefulWidget {
  const GPUWidget({
    super.key,
  });

  @override
  State<GPUWidget> createState() => _GPUWidgetState();
}

class _GPUWidgetState extends State<GPUWidget> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("Select a GPU"),
        DropdownButton(
          value: selectedValue,
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
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
      ],
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
    final l10n = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(l10n.protonInfoTitle),
              content: Text(l10n.protonInfoContent),
              actions: [],
            ),
          ),
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
    final l10n = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(l10n.mangoInfoTitle),
              content: Text(l10n.mangoInfoContent),
              actions: [],
            ),
          ),
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
    final l10n = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(l10n.gamemodeInfoTitle),
              content: Text(l10n.gamemodeInfoContent),
              actions: [],
            ),
          ),
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
