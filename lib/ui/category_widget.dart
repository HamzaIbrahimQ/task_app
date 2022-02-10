import 'package:flutter/material.dart';
import 'package:task_app/util/utility.dart';


class CategoryWidget extends StatelessWidget with Utility {
  final String title;
  final String? logoPath;
  final bool? isShowAll;

  CategoryWidget({
    required this.title,
    this.logoPath,
    this.isShowAll,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.blue[900],
          ),
          child: isShowAll ?? false
              ? const Icon(
            Icons.apps_outlined,
            color: Colors.white,
            size: 40,
          )
              : Image.network(
            logoPath ?? "",
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}