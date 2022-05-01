import 'package:flutter/material.dart';
import 'package:google_play_books/fragments/home_fragment.dart';
import 'package:google_play_books/fragments/library_fragment.dart';
import 'package:google_play_books/pages/search_page.dart';

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
        icon: Icon(Icons.file_copy_outlined),
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
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(13.0),
          child: GestureDetector(
            onTap: () {
              _navigateToSearchpage(context);
            },
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Search Play Books",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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

  void _navigateToSearchpage(
    BuildContext context,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SearchPage(),
      ),
    );
  }
}
