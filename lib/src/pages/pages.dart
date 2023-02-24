import 'package:flutter/widgets.dart';

import 'welcome/welcome_page.dart';
import 'actions/actions_page.dart';
import 'tips/tips_page.dart';
import 'about/about_page.dart';

class PageBuilder {
  const PageBuilder({
    required this.iconBuilder,
    required this.titleBuilder,
    required this.pageBuilder,
  });

  final WidgetBuilder iconBuilder;
  final WidgetBuilder titleBuilder;
  final WidgetBuilder pageBuilder;
}

const pages = [
  PageBuilder(
    iconBuilder: WelcomePage.buildIcon,
    titleBuilder: WelcomePage.buildTitle,
    pageBuilder: WelcomePage.buildDetail,
  ),
  PageBuilder(
    iconBuilder: ActionsPage.buildIcon,
    titleBuilder: ActionsPage.buildTitle,
    pageBuilder: ActionsPage.buildDetail,
  ),
  PageBuilder(
    iconBuilder: TipsPage.buildIcon,
    titleBuilder: TipsPage.buildTitle,
    pageBuilder: TipsPage.buildDetail,
  ),
  PageBuilder(
    iconBuilder: AboutPage.buildIcon,
    titleBuilder: AboutPage.buildTitle,
    pageBuilder: AboutPage.buildDetail,
  ),
];
