import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/persistance/book_list_dao.dart';
import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:hive/hive.dart';

class BookListDaoImpl extends BookListDao{
  static final BookListDaoImpl _singleton = BookListDaoImpl._internal();

  factory BookListDaoImpl() {
    return _singleton;
  }

  BookListDaoImpl._internal();

  Box<ListVO> getBookBox() {
    return Hive.box<ListVO>(BOX_NAME_BOOK_LIST_VO);
  }

  @override
  Stream<void> getAllBookEventStream() {
    return getBookBox().watch();
  }

  @override
  List<ListVO> getAllBooks() {
    return getBookBox().values.toList();
  }

  @override
  Stream<List<ListVO>> getAllBooksStream() {
    return Stream.value(getAllBooks());
  }

  @override
  void saveAllBooks(List<ListVO> bookList) async{
    Map<int, ListVO> bookMap = Map.fromIterable(bookList,
        key: (element) => element.listId, value: (element) => element);
    await getBookBox().putAll(bookMap);
  }

}