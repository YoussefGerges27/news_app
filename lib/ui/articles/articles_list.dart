import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:news_app/models/articles/articles_response.dart';
import 'package:news_app/models/sources/source.dart';
import 'package:news_app/ui/articles/article_item.dart';

class ArticlesList extends StatefulWidget {
  final Source source;
  const ArticlesList({super.key, required this.source});

  @override
  State<ArticlesList> createState() => _ArticlesListState();
}

class _ArticlesListState extends State<ArticlesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(widget.source.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          log(snapshot.error.toString());
          return Column(
            children: [
              Text(snapshot.error.toString()),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }
        ArticlesResponse? articlesResponse = snapshot.data;
        if (articlesResponse?.status == "error") {
          return Column(
            children: [
              Text(articlesResponse?.message ?? ""),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Try Again"),
              ),
            ],
          );
        }
        List<Article> articlesList = articlesResponse?.articles ?? [];
        return Padding(
          padding: EdgeInsets.all(16.r),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ArticleItem(
                article: articlesList[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }
}
