import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_play_books/dummy/ebooks.dart';
import 'package:google_play_books/pages/view_all_ebooks_page.dart';

import '../../dummy/dummy_data.dart';
import '../viewitems/ebook_view.dart';

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
      child: Container(
        height: MediaQuery.of(context).size.height,
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
                        ebookList: ebookList,
                        onTapEbook: () {},
                      ),
                    ],
                  ),
                  const Center(
                    child: Text(
                      "Audiobooks",
                    ),
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

class HorizontalEbookListView extends StatelessWidget {
  final List<Ebooks>? ebooksList;
  final Function(int?) onTapEbook;
  HorizontalEbookListView({
    required this.ebooksList,
    required this.onTapEbook,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 280,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: ebooksList?.length,
        itemBuilder: (context, index) {
          return EbookView(
            ebook: ebooksList?[index],
            onTapEbook: () {
              onTapEbook(1);
            },
          );
        },
      ),
    );
  }
}

class TabBarSectionView extends StatelessWidget {
  const TabBarSectionView({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.blue,
        controller: _tabController,
        labelColor: Colors.blue,
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
        unselectedLabelColor: Colors.black,
        tabs: const [
          Tab(
            child: Text(
              "Ebooks",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Tab(
            child: Text(
              "Audio Books",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
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
            "https://mir-s3-cdn-cf.behance.net/project_modules/1400/36849671126939.60bf362943f3a.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
            const Spacer(),
            Column(
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
          ],
        ),
      ),
    );
  }
}

class IconView extends StatelessWidget {
  IconData iconData;
  Function onTap;
  IconView({required this.iconData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          3.0,
        ),
        shape: BoxShape.rectangle,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 18.0,
      ),
    );
  }
}

/// fvm flutter build appbundle --release
/// play console ==> open testing
