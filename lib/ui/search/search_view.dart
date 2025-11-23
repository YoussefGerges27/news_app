import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:news_app/models/articles/articles_response.dart';
import 'package:news_app/ui/articles/article_item.dart';
import 'package:news_app/ui/search/widgets/search_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool isSearched = false;
  TextEditingController searchController = TextEditingController();
  Future<ArticlesResponse>? articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchTextField(
          searchController: searchController,
          onSubmit: (value) {
            setState(() {
              isSearched = true;
              articles = ApiManager.searchArticles(value);
            });
          },
        ),
      ),
      body: isSearched
          ? FutureBuilder(
              future: articles,
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
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemCount: articlesList.length,
                  ),
                );
              },
            )
          : Center(
              child: Text('No Search Yet'),
            ),
    );
  }
}
