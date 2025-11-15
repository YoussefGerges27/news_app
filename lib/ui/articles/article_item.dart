import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_styles.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              imageUrl:
                  "https://images.ctfassets.net/hrltx12pl8hq/28ECAQiPJZ78hxatLTa7Ts/2f695d869736ae3b0de3e56ceaca3958/free-nature-images.jpg?fit=fill&w=1200&h=630",
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
            '40-year-old man falls 200 feet to his death while canyoneering at national park',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By: Howard',
                style: AppStyles.medium12Grey,
              ),
              Text(
                '15 minutes ago',
                style: AppStyles.medium12Grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
