import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:google_play_books/persistance/overview_dao.dart';
import 'package:hive/hive.dart';

class OverviewDaoImpl extends OverviewDao {
  static final OverviewDaoImpl _singleton = OverviewDaoImpl._internal();

  factory OverviewDaoImpl() {
    return _singleton;
  }

  OverviewDaoImpl._internal();

  /// reactive programming
  @override
  Stream<void> getAllBookEventStream() {
    return getBookBox().watch(); // listen to data changes and notity
  }

  @override
  List<ListVO> getAllBooks() {
    return getBookBox().values.toList();
  }

  Box<ListVO> getBookBox() {
    return Hive.box<ListVO>(BOX_NAME_OVERVIEW_LIST_VO);
  }

  @override
  void saveAllBooks(List<ListVO> overviewList) async {
    Map<int, ListVO> bookMap = Map.fromIterable(overviewList,
        key: (element) => element.listId, value: (element) => element);
    await getBookBox().putAll(bookMap);
  }

  @override
  Stream<List<ListVO>> getAllBooksStream() {
    return Stream.value(getAllBooks());
  }
}
