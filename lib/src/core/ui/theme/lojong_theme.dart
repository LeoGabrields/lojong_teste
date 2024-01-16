import 'package:flutter/material.dart';

import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: ColorsApp.instance.primary,
  fontFamily: 'Asap',
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyles.instance.textTitle.copyWith(fontSize: 15),
    color: ColorsApp.instance.primary,
  ),
  tabBarTheme: TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    splashFactory: NoSplash.splashFactory,
    indicatorColor: Colors.transparent,
    dividerColor: Colors.transparent,
    unselectedLabelStyle: TextStyles.instance.textSemiBold,
    labelStyle: TextStyles.instance.textSemiBold,
    labelColor: const Color(0xFFBF7964),
    unselectedLabelColor: Colors.white,
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(55),
      color: Colors.white,
    ),
  ),
);
