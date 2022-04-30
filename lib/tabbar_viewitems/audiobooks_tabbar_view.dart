import 'package:flutter/material.dart';
import 'package:google_play_books/pages/ebooks_detail_page.dart';

import '../dummy/dummy_data.dart';
import '../pages/view_all_ebooks_page.dart';
import '../viewitems/ebooks_list_section_view.dart';

class AudioBookTabbarView extends StatefulWidget {
  const AudioBookTabbarView({Key? key}) : super(key: key);

  @override
  State<AudioBookTabbarView> createState() => _AudioBookTabbarViewState();
}

class _AudioBookTabbarViewState extends State<AudioBookTabbarView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 20.0,
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
