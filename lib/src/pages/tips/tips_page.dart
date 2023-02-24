import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:steam_tweaks/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  static Widget buildIcon(BuildContext context) {
    return const Icon(YaruIcons.information);
  }

  static Widget buildTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Text("Tips");
  }

  static Widget buildDetail(BuildContext context) {
    return TipsPage();
  }

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
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
        child: Html(
          data: l10n.tipText,
          shrinkWrap: true,
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
