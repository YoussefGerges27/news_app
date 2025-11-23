import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  void Function(String)? onSubmit;
  final TextEditingController searchController;
  SearchTextField({
    super.key,
    required this.onSubmit,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onSubmitted: (value) {
        onSubmit!(value);
      },
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(16.r),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).canvasColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).canvasColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: Theme.of(context).canvasColor,
          ),
        ),
        hintText: 'Search',
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Theme.of(context).canvasColor,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close_rounded,
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
    );
  }
}
