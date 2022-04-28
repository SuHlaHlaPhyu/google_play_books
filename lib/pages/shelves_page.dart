import 'package:flutter/material.dart';
import 'package:google_play_books/pages/viewitems/menu_item_view.dart';

import 'viewitems/shelve_title_section_view.dart';

class ShelvesPage extends StatefulWidget {
  const ShelvesPage({Key? key}) : super(key: key);

  @override
  State<ShelvesPage> createState() => _ShelvesPageState();
}

class _ShelvesPageState extends State<ShelvesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            //
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          MenuItemView(
            iconColor: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
              right: 0.0,
              top: 50,
              bottom: 20,
            ),
            child: ShelveTitleSectionView(
              title: "10 Integration Design book to read",
              subTitle: "3 Books",
            ),
          ),
          const Divider(
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
