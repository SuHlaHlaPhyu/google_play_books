import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_play_books/tabbar_viewitems/ebook_tabbar_view.dart';
import 'package:google_play_books/viewitems/shelf_menu_item_view.dart';
import 'package:google_play_books/viewitems/tabbar_section_view.dart';

import '../tabbar_viewitems/audiobooks_tabbar_view.dart';
import '../viewitems/icon_view.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 50.0,
                  ),
                  child: CarouselSilderListSectionView(
                    onTapDownload: () {
                      // download
                    },
                    onTapListen: () {
                      // listen
                    },
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TabBarSectionView(
                  tabController: _tabController,
                  tabBarOneName: "Ebooks",
                  tabBarTwoName: "Audio Books",
                ),
              ],
            ),
          )
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: const [
          EbookTabbarView(),
          AudioBookTabbarView(),
        ],
      ),
    );
  }
}

class CarouselSilderListSectionView extends StatelessWidget {
  final Function onTapDownload;
  final Function onTapListen;
  CarouselSilderListSectionView(
      {required this.onTapListen, required this.onTapDownload});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(),
      items: [
        CarouselSectionView(
          onTapDownload: () {
            onTapDownload();
          },
          onTapListen: () {
            onTapListen();
          },
        ),
      ],
    );
  }
}

class CarouselSectionView extends StatelessWidget {
  final Function onTapDownload;
  final Function onTapListen;
  CarouselSectionView({required this.onTapListen, required this.onTapDownload});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 220,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.template.net/wp-content/uploads/2018/04/Free-Non-fiction-Book-Cover.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              MenuItemView(),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconView(
                      iconData: Icons.play_circle,
                      onTap: () {
                        //
                        onTapListen();
                      },
                    ),
                    IconView(
                      iconData: Icons.download_done,
                      onTap: () {
                        //
                        onTapDownload();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3.0,
                ),
                const LinearProgressIndicator(
                  minHeight: 2.5,
                  backgroundColor: Colors.black,
                  value: 0.3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
