import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
  final void Function(String) onCategoryClick;

  CategoryItem({
    super.key,
    required this.category,
    required this.index,
    required this.onCategoryClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCategoryClick(category.title);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        alignment: index.isEven
            ? AlignmentDirectional.centerEnd
            : AlignmentDirectional.centerStart,
        width: double.infinity,
        height: 194.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          image: DecorationImage(image: AssetImage(category.imagePath)),
        ),
        child: Directionality(
          textDirection: index.isEven ? TextDirection.ltr : TextDirection.rtl,
          child: Column(
            textDirection: index.isEven ? TextDirection.ltr : TextDirection.ltr,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: 16,
                ),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(84.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View All',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(width: 10.w),
                    CircleAvatar(
                      radius: 27.r,
                      backgroundColor: AppColors.whiteColor,
                      child: SvgPicture.asset(
                        AppAssets.arroe,
                        matchTextDirection: true,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
