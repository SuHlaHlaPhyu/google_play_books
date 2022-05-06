import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/persistance/book_dao.dart';
import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:hive/hive.dart';

class BookDaoImpl extends BookDao{
  static final BookDaoImpl _singleton = BookDaoImpl._internal();

  factory BookDaoImpl() {
    return _singleton;
  }

  BookDaoImpl._internal();

  Box<BooksVO> getBookBox() {
    return Hive.box<BooksVO>(BOX_NAME_BOOK_VO);
  }

  @override
  Stream<void> getAllBookEventStream() {
    return getBookBox().watch();
  }

  @override
  List<BooksVO> getAllBooks() {
    return getBookBox().values.toList();
  }

  @override
  Stream<List<BooksVO>> getAllBooksStream() {
    return Stream.value(getAllBooks());
  }

  @override
  void saveAllBooks(List<BooksVO> bookList) async{
    Map<String, BooksVO> bookMap = Map.fromIterable(bookList, key: (element) => element.title, value: (element)=> element);
    await getBookBox().putAll(bookMap);
  }

  @override
  BooksVO? getBookByName(String title) {
    return getBookBox().get(title);
  }

  @override
  Stream<BooksVO?> getBookByNameStream(String title) {
    return Stream.value(getBookByName(title));
  }
  
}