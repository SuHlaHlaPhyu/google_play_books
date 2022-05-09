import 'package:flutter/material.dart';
import 'package:google_play_books/viewitems/sortby_view.dart';

import 'layout_view.dart';

class SortByAndLayoutSectionView extends StatefulWidget {
  final Function onTapSortBy;
  final Function onTapLayoutView;
  final bool is3x3GridView;
  final bool is2x2GridView;
  final bool islistView;
  final String sortName;
  SortByAndLayoutSectionView({
     required this.onTapSortBy,
    required this.onTapLayoutView,
    required this.is2x2GridView,
    required this.is3x3GridView,
    required this.islistView,
    this.sortName = "Recent"
  });

  @override
  State<SortByAndLayoutSectionView> createState() =>
      _SortByAndLayoutSectionViewState();
}

class _SortByAndLayoutSectionViewState
    extends State<SortByAndLayoutSectionView> {
  var val;
  int index= 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SortByView(
          filterName: widget.sortName,
          onTap: () {
            widget.onTapSortBy();
          },
        ),
        const Spacer(),
        LayoutView(
          onTap: () {
            widget.onTapLayoutView();
          },
          is3x3GridView: widget.is3x3GridView,
          is2x2GridView: widget.is2x2GridView,
          isListView: widget.islistView,
        ),
      ],
    );
  }


}
