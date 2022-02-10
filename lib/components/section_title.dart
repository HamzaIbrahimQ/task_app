import 'package:flutter/material.dart';



class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.borderRadius,
    required this.title
  }) : super(key: key);

  final BorderRadius borderRadius;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsetsDirectional.all(8.0),
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: Colors.grey.withOpacity(0.2),
            ),
            child: const Text(
              "عرض الكل",
              style:
              TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}