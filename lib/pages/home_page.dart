import 'package:flutter/material.dart';
import 'package:google_play_books/pages/fragments/home_fragment.dart';
import 'package:google_play_books/pages/fragments/library_fragment.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> buildBottomNavigationBarItems() {
    return const [
      BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: "Library",
        icon: Icon(Icons.file_copy),
      ),
    ];
  }

  int _selectedIndex = 0;

  List<Widget> widgetOptions = [
    const HomeFragment(),
    const LibraryFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: buildBottomNavigationBarItems(),
      ),
    );
  }
}
