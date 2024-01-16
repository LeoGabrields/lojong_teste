import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lojong_teste/src/core/provider/application_binding.dart';
import 'package:lojong_teste/src/core/ui/theme/lojong_theme.dart';
import 'package:lojong_teste/src/features/inspiration/inspiration_view.dart';

class LojongApp extends StatelessWidget {
  const LojongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        navigatorObservers:
            kDebugMode ? [ChuckerFlutter.navigatorObserver] : [],
        debugShowCheckedModeBanner: false,
        title: 'Lojong App',
        theme: themeData,
        home: const InspirationView(),
      ),
    );
  }
}
