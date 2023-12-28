import 'package:flutter/material.dart';

import 'package:lojong_teste/src/core/provider/application_binding.dart';
import 'package:lojong_teste/src/core/ui/theme/lojong_theme.dart';
import 'package:lojong_teste/src/view/inspiration_view.dart';

class LojongApp extends StatelessWidget {
  const LojongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lojong App',
        theme: LojongTheme.themeData,
        home: const InspirationView(),
      ),
    );
  }
}
