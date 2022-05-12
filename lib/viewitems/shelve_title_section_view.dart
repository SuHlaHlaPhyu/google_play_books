import 'package:flutter/material.dart';

class ShelveTitleSectionView extends StatelessWidget {
  final String title;
  final String subTitle;
  ShelveTitleSectionView({required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          child: Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: const TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: Flexible(
            child: Text(
              subTitle,
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
