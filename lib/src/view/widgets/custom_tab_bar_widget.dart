import 'package:flutter/material.dart';

class CustomTabbar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;
  const CustomTabbar({
    Key? key,
    required this.tabController,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55),
        color: const Color(0x1C000000),
      ),
      child: TabBar(
        controller: tabController,
        splashBorderRadius: BorderRadius.circular(55),
        indicatorPadding:
            const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        tabs: tabs,
      ),
    );
  }
}
