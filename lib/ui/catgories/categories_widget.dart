import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/ui/catgories/category_item.dart';

class CategoriesWidget extends StatelessWidget {
  final void Function(String) onCategoryClick;
  const CategoriesWidget({
    super.key,
    required this.onCategoryClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.welcome,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 16.h),

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return CategoryItem(
                  index: index,
                  category: CategoryModel.categories[index],
                  onCategoryClick: onCategoryClick,
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
