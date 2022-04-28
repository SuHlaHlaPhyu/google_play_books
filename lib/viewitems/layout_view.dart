import 'package:flutter/material.dart';

class LayoutView extends StatelessWidget {
  final bool isGridView;
  final Function onTap;
  LayoutView({
    required this.isGridView,
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
        child: isGridView
            ? const Icon(
                Icons.list,
              )
            : const Icon(
                Icons.grid_3x3_outlined,
              ),
      ),
    );
  }
}
