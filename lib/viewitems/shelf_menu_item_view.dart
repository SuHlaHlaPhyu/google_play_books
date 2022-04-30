import 'package:flutter/material.dart';

class MenuItemView extends StatefulWidget {
  final Color iconColor;
  MenuItemView({this.iconColor = Colors.white});

  @override
  State<MenuItemView> createState() => _MenuItemViewState();
}

class _MenuItemViewState extends State<MenuItemView> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: const EdgeInsets.all(0.0),
      icon: Icon(
        Icons.more_horiz,
        color: widget.iconColor,
        size: 32,
      ),
      itemBuilder: (BuildContext context) {
        return const [
          PopupMenuItem(
            child: Text("Rename Shelf"),
            value: 1,
          ),
          PopupMenuItem(
            child: Text("Delete Shelf"),
            value: 2,
          )
        ];
      },
    );
  }
}
