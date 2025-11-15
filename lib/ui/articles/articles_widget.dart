import 'package:flutter/material.dart';
import 'package:news_app/core/app_constants.dart';
import 'package:news_app/ui/articles/articles_list.dart';

class ArticlesWidget extends StatelessWidget {
  final category;
  const ArticlesWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: dummySources
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: TabBarTheme(
              child: ArticlesList(),
            ),
          ),
        ],
      ),
    );
  }
}
