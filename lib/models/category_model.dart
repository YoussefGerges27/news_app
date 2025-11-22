import 'package:news_app/core/utils/app_assets.dart';

class CategoryModel {
  String title;
  String imagePath;
  String id;
  CategoryModel({
    required this.title,
    required this.imagePath,
    required this.id,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      title: "General",
      id: "general",
      imagePath: AppAssets.general,
    ),
    CategoryModel(
      title: "Business",
      id: "business",
      imagePath: AppAssets.busniess,
    ),
    CategoryModel(
      title: "Sports",
      id: "sports",
      imagePath: AppAssets.sport,
    ),
    CategoryModel(
      title: "Technology",
      id: "technology",
      imagePath: AppAssets.technology,
    ),
    CategoryModel(
      title: "Science",
      id: "science",
      imagePath: AppAssets.science,
    ),
    CategoryModel(
      title: "Health",
      id: "health",
      imagePath: AppAssets.health,
    ),

    CategoryModel(
      title: "Entertainment",
      id: "entertainment",
      imagePath: AppAssets.entertainment,
    ),
  ];
}
