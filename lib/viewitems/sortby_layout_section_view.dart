import 'package:flutter/material.dart';
import 'package:google_play_books/viewitems/sortby_view.dart';

import 'layout_view.dart';

class SortByAndLayoutSectionView extends StatefulWidget {
  //final Function onTapSortBy;
  final Function onTapLayoutView;
  final bool is3x3GridView;
  final bool is2x2GridView;
  final bool islistView;
  SortByAndLayoutSectionView({
    //  required this.onTapSortBy,
    required this.onTapLayoutView,
    required this.is2x2GridView,
    required this.is3x3GridView,
    required this.islistView,
  });

  @override
  State<SortByAndLayoutSectionView> createState() =>
      _SortByAndLayoutSectionViewState();
}

class _SortByAndLayoutSectionViewState
    extends State<SortByAndLayoutSectionView> {
  var val;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SortByView(
          filterName: "Recent",
          onTap: () {
            showModalBottomSheetView(context);
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

  showModalBottomSheetView(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Sort by",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      Navigator.pop(context);
                      setState(() {
                        val = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    "Recently opened",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (value) {
                      Navigator.pop(context);
                      setState(() {
                        val = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    "Title",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: val,
                    onChanged: (value) {
                      Navigator.pop(context);
                      setState(() {
                        val = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  const Text(
                    "Author",
                    style: TextStyle(fontSize: 16.0),
                  )
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        );
      },
    );
  }
}
