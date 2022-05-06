import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/persistance/save_book_dao.dart';
import 'package:hive/hive.dart';

import '../hive_constant.dart';

class SaveBookDaoImpl extends SaveBookDao {
  static final SaveBookDaoImpl _singleton = SaveBookDaoImpl._internal();

  factory SaveBookDaoImpl() {
    return _singleton;
  }

  SaveBookDaoImpl._internal();

  Box<BooksVO> getBookBox() {
    return Hive.box<BooksVO>(BOX_NAME_SAVE_BOOKS_VO);
  }

  @override
  Stream<void> getAllBookEventStream() {
    return getBookBox().watch();
  }

  @override
  List<BooksVO> getAllBooks() {
    print("=================> get save ${getBookBox().values.toList()}");
    return getBookBox().values.toList();
  }

  @override
  Stream<List<BooksVO>> getAllBooksStream() {
    print("=================> get save steam ${Stream.value(getAllBooks())}");
    return Stream.value(getAllBooks());
  }

  @override
  void saveBook(BooksVO book) async{
    print("=================> to save $book");
   return getBookBox().put(book.title, book);
  }

}