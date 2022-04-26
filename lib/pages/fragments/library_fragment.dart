import 'package:flutter/material.dart';

class LibraryFragment extends StatefulWidget {
  const LibraryFragment({Key? key}) : super(key: key);

  @override
  State<LibraryFragment> createState() => _LibraryFragmentState();
}

class _LibraryFragmentState extends State<LibraryFragment> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Library"),
    );
  }
}
