import 'package:flutter/material.dart';
import 'package:task_app/providers/homeProvider/categories/categories_provider.dart';

import 'category_card.dart';




class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.categoriesProvider,
  }) : super(key: key);

  final CategoriesProvider categoriesProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categoriesProvider.categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(
                end: 16.0, start: 4.0),
            child: CategoryCard(
              title: categoriesProvider
                  .categories[index].name ??
                  "empty",
              logoPath:
              "https://rafiqi-backend.azurewebsites.net/${categoriesProvider.categories[index].logoPath}",
            ),
          );
        });
  }
}