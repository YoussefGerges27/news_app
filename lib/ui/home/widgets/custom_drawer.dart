import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';

class CustomDrawer extends StatelessWidget {
  final void Function()? onTap;
  const CustomDrawer({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.blackColor,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 166.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: Text(
              'News App',
              style: AppStyles.bold24Black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.homeIcon),
                      SizedBox(width: 8.w),
                      Text(
                        'Go To Home',
                        style: AppStyles.bold20White,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
