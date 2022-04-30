import 'package:flutter/material.dart';

import '../dummy/dummy_data.dart';
import '../viewitems/ebooks_list_section_view.dart';

class EbooksDetailPage extends StatefulWidget {
  @override
  State<EbooksDetailPage> createState() => _EbooksDetailPageState();
}

class _EbooksDetailPageState extends State<EbooksDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleSectionView(),
              const SizedBox(
                height: 15.0,
              ),
              TotalReviewAndPageSectionView(),
              const SizedBox(
                height: 15.0,
              ),
              ButtonSectionView(),
              const SizedBox(
                height: 5.0,
              ),
              const Divider(
                color: Colors.black,
              ),
              const SizedBox(
                height: 5.0,
              ),
              TitleAndSubtextSectionView(
                title: "About this ebook",
                subtext:
                    "Wondering how to write a book description that sells? This post details the process and provides book description examples from famous authors.Despite having a nice cover and receiving good reviews, it wasn’t selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.",
              ),
              const SizedBox(
                height: 15.0,
              ),
              TitleAndSubtextSectionView(
                title: "About the author",
                subtext:
                    "Wondering how to write a book description that sells? This post details the process and provides book description examples from famous authors.Despite having a nice cover and receiving good reviews, it wasn’t selling as many copies as it should have. So we dove into the book description, figured out the flaws, and completely revamped it.",
              ),
              const SizedBox(
                height: 15.0,
              ),
              EbooksListSectionView(
                "Similar books",
                ebookList: ebookList.toList(),
                noMargin: true,
                onTapEbook: (index) {
                  /// ebook details
                  // _navigateToEbooksDetailpage(context);
                },
                onTapViewAll: () {
                  //_navigateToViewAllpage(context, "Best Sellers");
                },
              ),
            ],
          ),
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
                style: TextStyle(fontSize: 14.0),
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
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: const Center(
              child: Text(
                "Buy \$3.4",
                style: TextStyle(fontSize: 14.0),
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
        Column(
          children: const [
            Icon(
              Icons.bookmark_outline,
            ),
            Text("Ebook"),
          ],
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
            image: const DecorationImage(
              image: NetworkImage(
                "https://cdn2.penguin.com.au/covers/original/9780718193911.jpg",
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
          child: const Text(
            "Good Vibes, Good Life : How Self-Love is the key to unlocking your greatness",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }
}
