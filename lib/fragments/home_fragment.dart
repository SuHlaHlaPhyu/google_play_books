import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/carousel_slider_bloc.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/tabbar_viewitems/ebook_tabbar_view.dart';
import 'package:google_play_books/viewitems/ebook_menu_itemview.dart';
import 'package:google_play_books/viewitems/tabbar_section_view.dart';
import 'package:provider/provider.dart';

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
  BookModel bookModel = BookModelImpl();
  CarouselSliderBloc? carouselSliderBloc;

  @override
  void initState() {
    carouselSliderBloc = CarouselSliderBloc();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    carouselSliderBloc?.clearDisposeNotify();
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => carouselSliderBloc,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            Selector<CarouselSliderBloc, List<BooksVO>?>(
              shouldRebuild: (previous, next) => previous != next,
              selector: (BuildContext context, bloc) => bloc.viewBookList,
              builder: (BuildContext context, bookList, Widget? child) {
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        key:const ValueKey("Carousel"),
                        padding: const EdgeInsets.only(
                          left: 50.0,
                        ),
                        child: CarouselSilderListSectionView(
                          bookList: bookList ?? [],
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
                );
              },
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            EbookTabbarView(),
            AudioBookTabbarView(),
          ],
        ),
      ),
    );
  }
}

class CarouselSilderListSectionView extends StatelessWidget {
  final Function onTapDownload;
  final Function onTapListen;
  final List<BooksVO> bookList;
  CarouselSilderListSectionView(
      {required this.onTapListen,
      required this.onTapDownload,
      required this.bookList});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
       //   autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          viewportFraction: 0.6,
          initialPage: 0
      ),
      items: bookList
          .map((e) => CarouselSectionView(
                book: e,
                onTapDownload: () {
                  onTapDownload();
                },
                onTapListen: () {
                  onTapListen();
                },
              ))
          .toList(),
    );
  }
}

class CarouselSectionView extends StatelessWidget {
  final Function onTapDownload;
  final Function onTapListen;
  final BooksVO book;
  CarouselSectionView(
      {required this.onTapListen,
      required this.onTapDownload,
      required this.book});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        image: DecorationImage(
          image: NetworkImage(
            "${book.bookImage}",
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
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: EbookMenuItemView(book: book,),
              ),
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
