import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'data/vos/books_vo.dart';
import 'data/vos/buy_links_vo.dart';
import 'data/vos/isbns_vo.dart';
import 'data/vos/list_vo.dart';
import 'data/vos/shelf_vo.dart';
import 'pages/home_page.dart';
import 'persistance/hive_constant.dart';

void main() async {
  await Hive.initFlutter();

  /// adapter
  Hive.registerAdapter(BuyLinkVOAdapter());
  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(OverviewLinkVOAdapter());
  Hive.registerAdapter(IsbnsVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  /// box
  await Hive.openBox<BooksVO>(BOX_NAME_SAVE_BOOKS_VO);
  await Hive.openBox<BooksVO>(BOX_NAME_BOOK_VO);
  await Hive.openBox<ListVO>(BOX_NAME_BOOK_LIST_VO);
  await Hive.openBox<ShelfVO>(BOX_NAME_SHELF_VO);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
/// fvm flutter build appbundle --release
/// play console ==> open testing
/// fvm flutter packages run build_runner build
/// fvm flutter packages run build_runner build --delete-conflicting-outputs
/// 
/// bottom to top
/// fvm flutter create.
/// fvm flutter pub get
/// flutter doctor -v
/// cd MZV2
/// fvm flutter upgrade
/// fvm list
///
/// Auth0