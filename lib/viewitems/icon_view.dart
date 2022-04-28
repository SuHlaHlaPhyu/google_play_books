import 'package:flutter/material.dart';

class IconView extends StatelessWidget {
  IconData iconData;
  Function onTap;
  IconView({required this.iconData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          3.0,
        ),
        shape: BoxShape.rectangle,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 18.0,
      ),
    );
  }
}
