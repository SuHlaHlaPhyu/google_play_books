import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/buy_links_vo.dart';
import 'package:google_play_books/data/vos/isbns_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:google_play_books/main.dart';
import 'package:google_play_books/pages/home_page.dart';
import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:integration_test/integration_test.dart';

import 'test_data/test_data.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
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

  testWidgets("google play book UI test", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await Future.delayed(const Duration(seconds: 3));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    /// home page
    expect(find.byType(HomePage), findsOneWidget);

    /// navigate to details
    // await tester.tap(find.text(HOME_E_BOOK));
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// find text in details
    // expect(find.text(HOME_E_BOOK), findsOneWidget);
    // expect(find.text(BOOK_AUTHOR), findsOneWidget);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
     final backKeyFinder = find.byKey(const ValueKey('back'));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(backKeyFinder);
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// Carousel
    // find.byKey(const ValueKey('Carousel'));
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// tap 2nd book
    // await tester.tap(find.text(SECOND_BOOK));
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// 2nd details
    // expect(find.text(SECOND_BOOK), findsOneWidget);
    // expect(find.text(SECOND_AUTHOR), findsOneWidget);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(backKeyFinder);
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// find search
    final searchFinder = find.byKey(const ValueKey("search"));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(searchFinder);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    /// enter search text
    final searchInput = find.byKey(const ValueKey('searchInput'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.enterText(searchInput, SEARCH_KEYWORD);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.text(SEARCH_RESULT));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text(SEARCH_RESULT), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(backKeyFinder);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.byKey(const ValueKey('searchBack')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // drag
    final gesture = await tester.startGesture(const Offset(0, 300));
    await gesture.moveBy(const Offset(0, -300));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    /// find and tap library
    final libraryFinder = find.byKey(const ValueKey('library'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(libraryFinder);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    /// swipe layout
    // final threeGridFinder = find.byKey(const ValueKey('three'));
    // final twoGridFinder = find.byKey(const ValueKey('two'));
    // final listFinder = find.byKey(const ValueKey('list'));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(threeGridFinder);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(twoGridFinder);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(listFinder);
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// 1st
    // expect(find.text(HOME_E_BOOK), findsOneWidget);
    // expect(find.text(BOOK_AUTHOR), findsOneWidget);
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// 2nd
    // expect(find.text(SECOND_BOOK), findsOneWidget);
    // expect(find.text(SECOND_AUTHOR), findsOneWidget);
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// sort by
    // final sortFinder = find.byKey(const ValueKey('sort'));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(sortFinder);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(find.byKey(const ValueKey('1')));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(sortFinder);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(find.byKey(const ValueKey('2')));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(sortFinder);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(find.byKey(const ValueKey('3')));
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// filter
    // await tester.tap(find.text(CHIP_ONE));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // expect(find.text(HOME_E_BOOK), findsOneWidget);
    // expect(find.text(BOOK_AUTHOR), findsOneWidget);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    //
    // await tester.tap(find.text(CHIP_TWO));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // expect(find.text(SECOND_BOOK), findsOneWidget);
    // expect(find.text(SECOND_AUTHOR), findsOneWidget);
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    //
    // await tester.tap(find.byKey(const ValueKey('cancel')));
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    /// create shelf
    await tester.tap(find.byKey(const ValueKey('shelves')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    /// 1st shelf
    await tester.tap(find.byKey(const ValueKey('create')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final inputFinder = find.byKey(const ValueKey('input'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.enterText(inputFinder, SHELF_ONE);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.byKey(const ValueKey('ok')));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text(SHELF_ONE), findsOneWidget);



    final home = find.byKey(const ValueKey('home'));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(home);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    /// find menu
    final menuFinder = find.byKey(const ValueKey(HOME_E_BOOK));
    await tester.pumpAndSettle(const Duration(seconds: 10));
    await tester.tap(menuFinder);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.byKey(const ValueKey('add')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.byKey(const ValueKey(SHELF_ONE)));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.byKey(const ValueKey("done")));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(libraryFinder);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(find.byKey(const ValueKey('shelves')));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    /// shelf detail
    final shelf = find.byKey(const ValueKey("viewAll"));
    await tester.pumpAndSettle(const Duration(seconds: 8));
    await tester.tap(shelf);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    /// find menu
    final shelfMenu = find.byKey(const ValueKey("shelfMenu"));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(shelfMenu);
    await tester.pumpAndSettle(const Duration(seconds: 5));
    /// rename
    final rename = find.byKey(const ValueKey("rename"));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(rename);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final renameInput = find.byKey(const ValueKey("renameInput"));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.enterText(renameInput, "Programming flutter");
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final renameDone = find.byKey(const ValueKey("renameDone"));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(renameDone);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text("Programming flutter"), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 5));


    /// delete
    await tester.tap(shelf);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await tester.tap(shelfMenu);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final delete = find.byKey(const ValueKey("delete"));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(delete);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    final yes = find.byKey(const ValueKey("yes"));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(yes);
    await tester.pumpAndSettle(const Duration(seconds: 5));




























    // /// 2nd shelf
    // await tester.tap(find.byKey(const ValueKey('create')));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    //
    // await tester.enterText(inputFinder, SHELF_TWO);
    // await tester.tap(find.byKey(const ValueKey('ok')));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // expect(find.text(SHELF_TWO), findsOneWidget);
    //
    // final yourBooks = find.byKey(const ValueKey('yourbooks'));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(yourBooks);
    // await tester.pumpAndSettle(const Duration(seconds: 5));

    // final gesture = await tester.startGesture(const Offset(0, 300));
    // await gesture.moveBy(const Offset(0, -500));
    // await tester.pumpAndSettle(const Duration(seconds: 10));

    // /// add 2nd book to shelf
    // await tester.tap(find.byKey(const ValueKey(SECOND_BOOK)));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    //
    // await tester.tap(find.byKey(const ValueKey('add')));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(find.byKey(const ValueKey(SHELF_ONE)));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(find.byKey(const ValueKey(SHELF_TWO)));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
    // await tester.tap(find.byKey(const ValueKey("done")));
    // await tester.pumpAndSettle(const Duration(seconds: 5));
  });
}
