import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/core/utils/dialog_utils.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:news_app/ui/articles/bottom_sheet.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showArticleModalBottomSheet(context);
        // DialogUtils.showArticleDialog(context, article);
      },
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Theme.of(context).canvasColor,
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                fit: BoxFit.fill,
                height: 220.h,
                width: double.infinity,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    Icons.error,
                    size: 30.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              article.title ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    article.author ?? '',
                    // overflow: TextOverflow.clip,
                    style: AppStyles.medium12Grey,
                  ),
                ),
                Text(
                  timeago.format(
                    DateTime.parse(article.publishedAt ?? ""),
                  ),
                  style: AppStyles.medium12Grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  showArticleModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      context: context,
      builder: (context) => ModalBottomSheet(
        article: article,
      ),
    );
  }
}
