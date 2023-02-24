import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:steam_tweaks/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yaru_icons/yaru_icons.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  static Widget buildIcon(BuildContext context) {
    return const Icon(YaruIcons.question);
  }

  static Widget buildTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Text("About");
  }

  static Widget buildDetail(BuildContext context) {
    return AboutPage();
  }

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
        child: SelectableHtml(
          data: l10n.aboutText,
          shrinkWrap: true,
          onAnchorTap: (url, _, __, ___) => launchUrlString(url!),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
