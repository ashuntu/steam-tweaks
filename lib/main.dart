import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubuntu_service/ubuntu_service.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'numbers.dart';
import 'settings.dart';

Future<void> main() async {
  await YaruWindowTitleBar.ensureInitialized();
  await windowManager.setSize(Size(100, 100));

  registerService(Numbers.new, dispose: (s) => s.close());

  runApp(
    ChangeNotifierProvider(
      create: (_) => Settings(),
      child: const NumbersApp(),
    ),
  );
}
