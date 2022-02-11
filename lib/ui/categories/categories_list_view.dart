import 'package:flutter/material.dart';
import 'package:task_app/models/categories_data_model.dart';
import 'category_card.dart';




class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<CategoriesDataModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(
                end: 16.0, start: 4.0),
            child: CategoryCard(
              title: categories[index].name ??
                  "empty",
              logoPath:
              "https://rafiqi-backend.azurewebsites.net/${categories[index].logoPath}",
            ),
          );
        });
  }
}