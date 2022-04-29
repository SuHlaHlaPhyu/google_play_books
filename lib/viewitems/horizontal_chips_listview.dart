import 'package:flutter/material.dart';

class HorizontalChipsListview extends StatelessWidget {
  final List<String>? chipsList;
  final Function(int?) onTapEbook;
  HorizontalChipsListview({
    required this.chipsList,
    required this.onTapEbook,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapEbook(1);
      },
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Chip(
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                backgroundColor: Colors.white10,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10.0,
                ),
                label: Text(
                  "download",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
