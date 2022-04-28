import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_play_books/dummy/ebooks.dart';
import 'package:google_play_books/pages/view_all_ebooks_page.dart';
import 'package:google_play_books/pages/viewitems/icon_view.dart';

import '../../dummy/dummy_data.dart';
import '../viewitems/horizontal_ebooks_listview.dart';
import '../viewitems/menu_item_view.dart';
import '../viewitems/tabbar_section_view.dart';

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
    return SingleChildScrollView(
      child: SizedBox(
        height: 1000,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
              ),
              child: CarouselSilderListSectionView(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TabBarSectionView(
              tabController: _tabController,
              tabBarOneName: "Ebooks",
              tabBarTwoName: "Audio Books",
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      EbooksListSectionView(
                        "Recent price drops",
                        ebookList: ebookList,
                        onTapEbook: () {},
                      ),
                      EbooksListSectionView(
                        "Best Sellers",
                        ebookList: ebookList.reversed.toList(),
                        onTapEbook: () {},
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      EbooksListSectionView(
                        "Best Sellers",
                        ebookList: ebookList.reversed.toList(),
                        onTapEbook: () {},
                      ),
                      EbooksListSectionView(
                        "Recent price drops",
                        ebookList: ebookList,
                        onTapEbook: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EbooksListSectionView extends StatelessWidget {
  final String title;
  final List<Ebooks>? ebookList;
  final Function onTapEbook;
  EbooksListSectionView(
    this.title, {
    required this.ebookList,
    required this.onTapEbook,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 15,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                ///
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewAllEbooksPage(
                      ebooksList: ebookList,
                      title: title,
                    ),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size: 18.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        HorizontalEbookListView(
          ebooksList: ebookList,
          onTapEbook: (movieId) => onTapEbook(movieId),
        ),
      ],
    );
  }
}

class CarouselSilderListSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          // aspectRatio: 3 / 2,
          // enlargeCenterPage: true,
          ),
      items: [
        CarouselSectionView(),
      ],
    );
  }
}

class CarouselSectionView extends StatelessWidget {
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
                      },
                    ),
                    IconView(
                      iconData: Icons.download_done,
                      onTap: () {
                        //
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



/// fvm flutter build appbundle --release
/// play console ==> open testing
