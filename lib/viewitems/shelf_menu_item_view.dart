import 'package:flutter/material.dart';

class MenuItemView extends StatefulWidget {
  final Color iconColor;
  final Function onTapRename;
  final Function onTapDelete;
  MenuItemView(
      {this.iconColor = Colors.white,
      required this.onTapRename,
      required this.onTapDelete});

  @override
  State<MenuItemView> createState() => _MenuItemViewState();
}

class _MenuItemViewState extends State<MenuItemView> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: const EdgeInsets.all(0.0),
      icon: Icon(
        Icons.more_vert,
        color: widget.iconColor,
        size: 30,
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: const Text("Rename Shelf"),
            value: 1,
            onTap: () {
              //
              widget.onTapRename();
            },
          ),
          PopupMenuItem(
            child: const Text("Delete Shelf"),
            value: 2,
            onTap: () {
              //
              widget.onTapDelete();
            },
          ),
        ];
      },
    );
  }
}
