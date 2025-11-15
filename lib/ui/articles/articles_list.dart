import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/articles/article_item.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return ArticleItem();
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: 10,
      ),
    );
  }
}
