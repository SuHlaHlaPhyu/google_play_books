import 'package:flutter/material.dart';

class ShelveTitleSectionView extends StatelessWidget {
  final String title;
  final String subTitle;
  ShelveTitleSectionView({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 16 * 16,
          child: Text(
            title,
            overflow: TextOverflow.clip,
            softWrap: true,
            style: const TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
