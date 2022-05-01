import 'package:flutter/material.dart';

class EbookMenuItemView extends StatefulWidget {
  Color iconColor;
  EbookMenuItemView({this.iconColor = Colors.white});

  @override
  State<EbookMenuItemView> createState() => _EbookMenuItemViewState();
}

class _EbookMenuItemViewState extends State<EbookMenuItemView> {
  var val;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheetView(context);
      },
      child: Icon(
        Icons.more_horiz,
        color: widget.iconColor,
      ),
    );
  }

  showModalBottomSheetView(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 8,
                      ),
                      height: 70,
                      width: 50,
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
                      width: 4.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Good Vibes, Good Life",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "Cammilo",
                          style: TextStyle(
                            fontSize: 13.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                contentPadding: const EdgeInsets.all(0.0),
                minLeadingWidth: 5.0,
                minVerticalPadding: 0.0,
                leading: const Icon(Icons.add),
                title: const Text('Add to shelf'),
                onTap: () {
                  Navigator.pop(context);
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
