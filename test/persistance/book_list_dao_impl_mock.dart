import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/persistance/book_list_dao.dart';

import '../mock_data/mock_data.dart';

class BookListDaoImplMock extends BookListDao{
  Map<int, ListVO> booksInDatabaseMock = {};
  @override
  Stream<void> getAllBookEventStream() {
    return Stream<void>.value(null);
  }

  @override
  List<ListVO> getAllBooks() {
    return getOverViewBooksMock();
  }

  @override
  Stream<List<ListVO>> getAllBooksStream() {
   return Stream.value(getOverViewBooksMock());
  }

  @override
  void saveAllBooks(List<ListVO> bookList) {
    bookList.forEach((element) =>booksInDatabaseMock[element.listId ?? 0] = element);
  }

}