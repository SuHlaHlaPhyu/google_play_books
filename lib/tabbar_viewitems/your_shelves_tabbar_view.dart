import 'package:flutter/material.dart';
import 'package:google_play_books/fragments/library_fragment.dart';

import '../dummy/dummy_data.dart';
import '../pages/shelves_page.dart';

class YourShelvesTabbarView extends StatefulWidget {
  const YourShelvesTabbarView({Key? key}) : super(key: key);

  @override
  State<YourShelvesTabbarView> createState() => _YourShelvesTabbarViewState();
}

class _YourShelvesTabbarViewState extends State<YourShelvesTabbarView> {
  @override
  Widget build(BuildContext context) {
    return ShelvesEbookListView(
      isShelves: true,
      ebooksList: ebookList,
      onTapEbook: (index) {
        _navigateToShelvesPage(context);
      },
      onTapViewAll: () {
        _navigateToShelvesPage(context);
      },
    );
  }

  void _navigateToShelvesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ShelvesPage(),
      ),
    );
  }
}
