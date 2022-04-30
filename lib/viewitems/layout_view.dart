import 'package:flutter/material.dart';

class LayoutView extends StatelessWidget {
  final bool is3x3GridView;
  final bool is2x2GridView;
  final bool isListView;
  final Function onTap;
  LayoutView({
    required this.is3x3GridView,
    required this.is2x2GridView,
    required this.isListView,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10.0,
        ),
        child: is3x3GridView
            ? const Icon(
                Icons.list,
              )
            : is2x2GridView
                ? const Icon(
                    Icons.grid_on,
                    size: 16.0,
                  )
                : const Icon(
                    Icons.grid_view,
                    size: 16.0,
                  ),
      ),
    );
  }
}
