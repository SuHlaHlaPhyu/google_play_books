import 'package:flutter/material.dart';
import 'package:google_play_books/dummy/dummy_data.dart';

import '../pages/ebooks_detail_page.dart';
import '../pages/view_all_ebooks_page.dart';
import '../viewitems/ebooks_list_section_view.dart';

class EbookTabbarView extends StatefulWidget {
  const EbookTabbarView({Key? key}) : super(key: key);

  @override
  State<EbookTabbarView> createState() => _EbookTabbarViewState();
}

class _EbookTabbarViewState extends State<EbookTabbarView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        EbooksListSectionView(
          "Recent price drops",
          ebookList: ebookList,
          onTapEbook: (index) {
            _navigateToEbooksDetailpage(context);
          },
          onTapViewAll: () {
            _navigateToViewAllpage(context, "Recent price drops");
          },
        ),
        EbooksListSectionView(
          "Best Sellers",
          ebookList: ebookList.reversed.toList(),
          onTapEbook: (index) {
            _navigateToEbooksDetailpage(context);
          },
          onTapViewAll: () {
            _navigateToViewAllpage(context, "Best Sellers");
          },
        ),
      ],
    );
  }

  void _navigateToViewAllpage(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewAllEbooksPage(
          ebooksList: ebookList,
          title: title,
        ),
      ),
    );
  }

  void _navigateToEbooksDetailpage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(),
      ),
    );
  }
}
