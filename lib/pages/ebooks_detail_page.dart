import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_play_books/blocs/book_detail_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../data/vos/books_vo.dart';
import '../viewitems/ebooks_list_section_view.dart';
import 'add_to_shelf_page.dart';

class EbooksDetailPage extends StatelessWidget {
  final String title;
  final String category;
  final List<BooksVO>? similarBooks;
  EbooksDetailPage({required this.title,this.similarBooks,required this.category});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => BookDetailBloc(title,category),
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
              key: ValueKey("back"),
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
                    const SizedBox(
                      height: 18.0,
                    ),
                    const RatingAndReviewSection(),
                    const SizedBox(
                      height: 18.0,
                    ),
                    Selector<BookDetailBloc, List<BooksVO>?>(
                      selector: (BuildContext context, bloc) => bloc.similarBook,
                      builder: (BuildContext context, similarBook, Widget? child){
                        return EbooksListSectionView(
                          "Similar books",
                          ebookList: similarBook ?? [],
                          noMargin: true,
                          onTapEbook: (index) {
                            _navigateToEbooksDetailpage(context, similarBook?[index ?? 0].title ?? "", similarBook?[index ?? 0].category ?? "");
                          },
                          onTapViewAll: () {},
                          onTapMenu: (index){
                            showModalBottomSheetMenuView(context,similarBook?[index ?? 0]);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const WriteReviewSection(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  void _navigateToEbooksDetailpage(BuildContext context, String bookName, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EbooksDetailPage(
          title: bookName,
          category: category,
        ),
      ),
    );
  }

  showModalBottomSheetMenuView(BuildContext context,BooksVO? book) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Divider(),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.remove),
                title: const Text('Remove download'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.delete),
                title: const Text('Delete from library'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                key: const ValueKey("add"),
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.add),
                title: const Text('Add to shelf'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToShelfPage(book: book,),
                    ),
                  );
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.bookmark),
                title: const Text('About this ebook'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Center(
                  child: Text(
                    "Buy \$4.9",
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        );
      },
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
        Container(
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
        const SizedBox(
          width: 15.0,
        ),
        Container(
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
class WriteReviewSection extends StatelessWidget {
  const WriteReviewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Rate this eBook"),
        const SizedBox(height: 8),
        const NormalText(
          text: "Tell other what you think",
          color: Colors.black54,
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              RatingBarIndicator(
                rating: 0,
                itemCount: 5,
                itemSize: 40,
                itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => debugPrint("Write a review"),
                child: const Text("Write a review"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RatingAndReviewSection extends StatelessWidget {
  const RatingAndReviewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "Ratings and reviews",
        ),
        SizedBox(height: 20),
        RatingView(),
        SizedBox(height: 30),
        ReviewView(
          username: "John Smith",
          profileUrl: "https://wallpaperaccess.com/full/6295120.jpg",
          date: "22 Jan 2022",
          rating: 5.0,
        ),
        ReviewView(
          username: "Eliza",
          profileUrl: "https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg?cs=srgb&dl=pexels-pixabay-60597.jpg&fm=jpg",
          date: "5 May 2021",
          rating: 2.0,
        ),
        ReviewView(
          username: "May Honey",
          profileUrl: "https://i.pinimg.com/originals/3a/74/5d/3a745d3dcba72feb73e44e399ec97bea.jpg",
          date: "25 Dec 2021",
          rating: 5.0,
        )
      ],
    );
  }
}
class ReviewView extends StatelessWidget {
  const ReviewView(
      {Key? key,
        required this.username,
        required this.profileUrl,
        required this.date,
        required this.rating})
      : super(key: key);
  final String username;
  final String profileUrl;
  final String date;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(profileUrl),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalText(text: username),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: rating,
                    itemCount: 5,
                    itemSize: 18,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  NormalText(text: date),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                  "If we provided top-notch service to you today, please consider taking a few seconds to leave us a review"),
              const SizedBox(height: 16),
              const NormalText(text: "Was this review helpful ?"),
              const SizedBox(height: 16.0),
            ],
          ),
        )
      ],
    );
  }
}
class RatingView extends StatelessWidget {
  const RatingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const NormalText(
              text: "5.0",
              textSize: 50,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 6),
            RatingBarIndicator(
              rating: 5.0,
              itemCount: 5,
              itemSize: 18,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
               "28 total",
            )
          ],
        ),
        Column(
          children: const [
            RatingProgressBarView(
              ratingLevel: "5",
              percent: 0.9,
            ),
            SizedBox(
              height: 4,
            ),
            RatingProgressBarView(
              ratingLevel: "4",
              percent: 0.2,
            ),
            SizedBox(
              height: 4,
            ),
            RatingProgressBarView(
              ratingLevel: "3",
              percent: 0,
            ),
            SizedBox(
              height: 4,
            ),
            RatingProgressBarView(
              ratingLevel: "2",
              percent: 0,
            ),
            SizedBox(
              height: 4,
            ),
            RatingProgressBarView(
              ratingLevel: "1",
              percent: 0,
            )
          ],
        )
      ],
    );
  }
}
class RatingProgressBarView extends StatelessWidget {
  const RatingProgressBarView(
      {Key? key, required this.ratingLevel, required this.percent})
      : super(key: key);
  final String ratingLevel;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NormalText(text: ratingLevel),
        const SizedBox(
          width: 5,
        ),
        LinearPercentIndicator(
          width: MediaQuery.of(context).size.width * 0.6,
          lineHeight: 10,
          percent: percent,
          progressColor: Colors.blue,
          backgroundColor: Colors.grey[300],
          barRadius: const Radius.circular(10),
        ),
      ],
    );
  }
}
class NormalText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final FontWeight fontWeight;

  const NormalText({
    Key? key,
    required this.text,
    this.color = Colors.black87,
    this.textSize = 16,
    this.fontWeight = FontWeight.normal
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color,
          fontSize: textSize,
          fontWeight: fontWeight
      ),
    );
  }
}
