import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/create_shelf_bloc.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:provider/provider.dart';

class CreateNewShelf extends StatefulWidget {
  CreateNewShelf({Key? key}) : super(key: key);

  @override
  State<CreateNewShelf> createState() => _CreateNewShelfState();
}

class _CreateNewShelfState extends State<CreateNewShelf> {
  TextEditingController userInput = TextEditingController();
  FocusNode inputFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateShelfBloc(),
      child: Selector<CreateShelfBloc, List<ShelfVO>?>(
        selector: (BuildContext context, bloc) => bloc.shelfList,
        builder: (BuildContext context, shelfList, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                onTap: () {
                  CreateShelfBloc bloc = Provider.of(context, listen: false);
                  bloc.createShelf(ShelfVO(userInput.text.toString(), [], false));
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: userInput,
                focusNode: inputFocus,
                autofocus: true,
                decoration: const InputDecoration(hintText: "Shelf name"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ),
          );
        },
      ),
    );
  }
}
