import 'package:flutter/material.dart';

import 'package:lojong_teste/src/features/article/view/articles_view.dart';
import 'package:lojong_teste/src/features/quotes/view/quote_view.dart';
import 'package:lojong_teste/src/features/video/view/list_video_view.dart';
import '../../core/ui/widgets/custom_tab_bar_widget.dart';

class InspirationView extends StatefulWidget {
  const InspirationView({super.key});

  @override
  State<InspirationView> createState() => _InspirationViewState();
}

class _InspirationViewState extends State<InspirationView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE09090),
        title: const Text('INSPIRAÇÕES'),
      ),
      body: Column(
        children: [
          CustomTabbar(
            tabController: _tabController,
            tabs: const [
              Tab(text: 'VÍDEOS'),
              Tab(text: 'ARTIGOS'),
              Tab(text: 'CITAÇÕES'),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(17),
                  topRight: Radius.circular(17),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1.12),
                    blurRadius: 4,
                    color: Color(0x22000000),
                  )
                ],
              ),
              child: TabBarView(
                controller: _tabController,
                children: const <Widget>[
                  VideoView(),
                  ArticlesView(),
                  QuoteView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
