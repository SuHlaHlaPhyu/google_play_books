import 'package:flutter/material.dart';
import 'package:google_play_books/blocs/book_detail_bloc.dart';
import 'package:provider/provider.dart';

import '../data/vos/books_vo.dart';
import '../viewitems/ebooks_list_section_view.dart';

class EbooksDetailPage extends StatelessWidget {
  final String title;
  final List<BooksVO>? similarBooks;
  EbooksDetailPage({required this.title,this.similarBooks});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => BookDetailBloc(title),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            const Icon(
              Icons.search,
              color: Colors.black,
            ),
            const SizedBox(
              width: 15.0,
            ),
            const Icon(
              Icons.bookmark_add_outlined,
              color: Colors.black,
            ),
            const SizedBox(
              width: 4.0,
            ),
            PopupMenuButton(
              padding: const EdgeInsets.all(0.0),
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    height: 13.0,
                    child: Text("Share"),
                    value: 1,
                  ),
                ];
              },
            ),
            const SizedBox(
              width: 8.0,
            ),
          ],
        ),
        body: Selector<BookDetailBloc, BooksVO?>(
          selector: (BuildContext context, bloc) => bloc.bookDetail,
          builder: (BuildContext context, detail, Widget? child){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TitleSectionView(booksVO: detail,),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TotalReviewAndPageSectionView(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    ButtonSectionView(price: detail?.price ?? "",),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    TitleAndSubtextSectionView(
                      title: "About this ebook",
                      subtext:
                      detail?.description ?? "Despite having a nice cover and receiving good reviews, it wasn’t selling as many copies as it should have. So we dove into the book description,",
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    TitleAndSubtextSectionView(
                      title: "About the author",
                      subtext:
                      "Wondering how to write a book description that sells? This post details the process and provides book description examples from famous authors.Despite having a nice cover and receiving good reviews, it wasn’t selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.",
                    ),
                    // const SizedBox(
                    //   height: 18.0,
                    // ),
                    // EbooksListSectionView(
                    //   "Similar books",
                    //   ebookList: similarBooks ?? [],
                    //   noMargin: true,
                    //   onTapEbook: (index) {},
                    //   onTapViewAll: () {},
                    // ),
                  ],
                ),
              ),
            );
          },

        ),
      ),
    );
  }
}

class TitleAndSubtextSectionView extends StatelessWidget {
  final String title;
  final String subtext;
  TitleAndSubtextSectionView({
    required this.title,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                /// view all
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_forward,
                  size: 20.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          subtext,
        )
      ],
    );
  }
}

class ButtonSectionView extends StatelessWidget {
  final String? price;
  ButtonSectionView({required this.price});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: const Center(
              child: Text(
                "Free sample",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Container(
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Center(
              child: Text(
                "Buy \$ $price",
                style:const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TotalReviewAndPageSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10.0,
        ),
        Column(
          children: [
            Row(
              children: const [
                Text(
                  "4.6",
                ),
                Icon(
                  Icons.star,
                  size: 18.0,
                )
              ],
            ),
            const Text("183 reviews")
          ],
        ),
        const Spacer(),
        Container(
          height: 30.0,
          width: 1.0,
          color: Colors.black54,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        ),
        const Spacer(),
        Column(
          children: const [
            Icon(
              Icons.bookmark_outline,
              color: Colors.black54,
            ),
            Text("Ebook"),
          ],
        ),
        const Spacer(),
        Container(
          height: 30.0,
          width: 1.0,
          color: Colors.black54,
          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        ),
        const Spacer(),
        Column(
          children: const [
            Text("368"),
            Text(
              "Pages",
            )
          ],
        ),
        const SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}

class TitleSectionView extends StatelessWidget {
  final BooksVO? booksVO;
  TitleSectionView({required this.booksVO});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 8,
          ),
          height: 160,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5,
            ),
            image: DecorationImage(
              image: NetworkImage(
                "${booksVO?.bookImage}",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 12.0,
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 8,
          ),
          height: 150,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                booksVO?.title ?? "",
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ), Text(
                booksVO?.author ?? "",
                style: const TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
