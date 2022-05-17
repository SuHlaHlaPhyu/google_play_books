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
  final ScrollController homeController = ScrollController();
  List<BottomNavigationBarItem> buildBottomNavigationBarItems() {
    return const [
      BottomNavigationBarItem(
        label: "Home",
        icon: Icon(Icons.home,key: ValueKey("home"),),
      ),
      BottomNavigationBarItem(
        label: "Library",
        icon: Icon(
          Icons.library_books,
          key: ValueKey("library"),
        ),
      ),
    ];
  }

  int _selectedIndex = 0;

  Widget _buildOffstage(int index, Widget page) {
    return Offstage(
      offstage: index != _selectedIndex,
      child: TickerMode(
        enabled: index == _selectedIndex,
        child: page,
      ),
    );
  }

  List<Widget> widgetOptions(){
    return [
      HomeFragment(homeController : homeController),
      const LibraryFragment(),
    ];
  }

  void _selectedTab(int index) {
    if (_selectedIndex == index) {
      if (index == 0) {
        if (homeController.hasClients) {
          homeController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(seconds: 2),
          );
        }
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

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
              key: const ValueKey("search"),
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 245, 245, 1),
                borderRadius: BorderRadius.circular(1),
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
                  Spacer(),
                  CircleAvatar(
                    radius: 15.0,
                    backgroundImage: NetworkImage(
                      'https://www.whatsappimages.in/wp-content/uploads/2021/02/Beautiful-Girls-Whatsapp-DP-Profile-Images-pics-for-download-300x300.gif',
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: widgetOptions()[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedTab(index);
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
