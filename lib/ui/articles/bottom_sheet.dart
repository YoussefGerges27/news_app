import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/articles/article.dart';
import 'package:news_app/ui/articles/webview_page.dart';

class ModalBottomSheet extends StatelessWidget {
  final Article article;
  const ModalBottomSheet({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          SizedBox(height: 20.h),
          Text(
            article.content ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 20.h),
          Container(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WebviewPage(url: article.url!),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
              ),
              child: Text(
                'View Full Article',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
