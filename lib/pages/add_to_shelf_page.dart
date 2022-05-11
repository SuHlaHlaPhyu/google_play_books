import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/add_to_shelf_bloc.dart';
import '../data/vos/shelf_vo.dart';
import '../viewitems/shelf_list_view.dart';

class AddToShelfPage extends StatelessWidget {
  const AddToShelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddToShelfBloc(),
      child: Selector<AddToShelfBloc, List<ShelfVO>?>(
        shouldRebuild: (previous, next) => previous != next,
        selector: (BuildContext context, bloc) => bloc.shelfList,
        builder: (BuildContext context, shelfList, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              elevation: 0.0,
              titleSpacing: 0.0,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.keyboard_backspace,
                  color: Colors.blue,
                ),
              ),
              title: const Text(
                "Add to Shelf",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            body: ShelvesEbookListView(
              selectShelf: true,
              isShelves: true,
              shelfList: shelfList,
              onTapEbook: (name) {
                AddToShelfBloc bloc = Provider.of(context, listen: false);
                bloc.selectShelf(name ?? "");
              },
              onTapViewAll: () {
                //
              },
            ),
          );
        },
      ),
    );
  }
}
