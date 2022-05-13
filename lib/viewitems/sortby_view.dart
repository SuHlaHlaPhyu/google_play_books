import 'package:flutter/material.dart';

class SortByView extends StatelessWidget {
  final Function onTap;
  final String filterName;
  SortByView({required this.onTap, required this.filterName});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: const Padding(
            padding: EdgeInsets.only(
              left: 10.0,
            ),
            child: Icon(Icons.sort,key: ValueKey("sort"),),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text("Sort by : $filterName"),
      ],
    );
  }
}