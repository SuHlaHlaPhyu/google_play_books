import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
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
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
