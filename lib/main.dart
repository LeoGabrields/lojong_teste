import 'package:flutter/material.dart';
import 'package:lojong_teste/src/core/path_provider/app_path_provider.dart';
import 'package:lojong_teste/src/lojong_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPathProvider.initPath();

  runApp(const LojongApp());
}
