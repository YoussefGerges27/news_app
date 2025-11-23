import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/ui/articles/articles_widget.dart';
import 'package:news_app/ui/home/widgets/custom_drawer.dart';
import 'package:news_app/ui/catgories/categories_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? "Home" : selectedCategory!,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.search);
            },
            child: SvgPicture.asset(
              AppAssets.searchIcon,
              colorFilter: ColorFilter.mode(
                Theme.of(context).canvasColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(
        onTap: () {
          selectedCategory = null;
          Navigator.pop(context);
          setState(() {});
        },
      ),
      body: selectedCategory == null
          ? CategoriesWidget(
              onCategoryClick: onCategoryClick,
            )
          : ArticlesWidget(
              category: selectedCategory,
            ),
    );
  }

  onCategoryClick(String newCategory) {
    selectedCategory = newCategory;
    setState(() {});
    // User("Ahmed",20,"M");
  }
}
