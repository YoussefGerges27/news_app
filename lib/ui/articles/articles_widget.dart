import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/utils/app_constants.dart';
import 'package:news_app/models/sources/source.dart';
import 'package:news_app/models/sources/sources_response.dart';
import 'package:news_app/ui/articles/articles_list.dart';

class ArticlesWidget extends StatefulWidget {
  final category;
  const ArticlesWidget({
    super.key,
    required this.category,
  });

  @override
  State<ArticlesWidget> createState() => _ArticlesWidgetState();
}

class _ArticlesWidgetState extends State<ArticlesWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(widget.category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // handle loading case
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          // handle error case
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
        SourcesResponse? sourcesResponse = snapshot.data;
        if (sourcesResponse?.status == "error") {
          return Column(
            children: [
              Text(sourcesResponse?.message ?? ""),
              ElevatedButton(onPressed: () {}, child: Text("Try Again")),
            ],
          );
        }
        List<Source> sourcesList = sourcesResponse?.sources ?? [];
        return DefaultTabController(
          length: sourcesList.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: sourcesList
                    .map(
                      (e) => Tab(
                        text: e.name,
                      ),
                    )
                    .toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: sourcesList
                      .map(
                        (e) => ArticlesList(),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
