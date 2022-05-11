import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/shelf_bloc.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:provider/provider.dart';

import '../pages/shelves_page.dart';
import '../viewitems/shelf_list_view.dart';

class YourShelvesTabbarView extends StatefulWidget {
  const YourShelvesTabbarView({Key? key}) : super(key: key);

  @override
  State<YourShelvesTabbarView> createState() => _YourShelvesTabbarViewState();
}

class _YourShelvesTabbarViewState extends State<YourShelvesTabbarView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShelfBloc(),
      child: Selector<ShelfBloc, List<ShelfVO>?>(
        selector: (BuildContext context, bloc) => bloc.shelfList,
        builder: (BuildContext context, shelfList, Widget? child) {
          return ShelvesEbookListView(
            isShelves: true,
            shelfList: shelfList,
            onTapEbook: (index) {
              _navigateToShelvesPage(context,index ?? "");
            },
            onTapViewAll: (title) {
              _navigateToShelvesPage(context, title ?? "");
            },
          );
        },
      ),
    );
  }

  void _navigateToShelvesPage(BuildContext context,String shelfName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShelvesPage(shelfName: shelfName,),
      ),
    );
  }
}
