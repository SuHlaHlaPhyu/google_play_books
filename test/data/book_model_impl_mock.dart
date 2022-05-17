import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';

import '../mock_data/mock_data.dart';

class BookModelImplMock extends BookModel{
  @override
  void addBookToShelf(BooksVO? book) {
    // TODO: implement addBookToShelf
  }

  @override
  void createShelf(ShelfVO shelf) {
    // TODO: implement createShelf
  }

  @override
  void deleteShelf(int shelfId) {
    // TODO: implement deleteShelf
  }

  @override
  Stream<List<ShelfVO>> getAllShelfStream() {
    return Stream.value(getShelfList());
  }

  @override
  Stream<ShelfVO> getBookByShelfStream(String name) {
    return Stream.value(getShelfList().first);
  }

  @override
  Future<BooksVO?> getBookDetails(String name) {
    return Future.value(getBookList().first);
  }

  @override
  Future<List<BooksVO>> getBooksByListName(String listName) {
    return Future.value(getBookList());
  }

  @override
  void getOverviewBooks() {
    getOverViewBooksMock();
  }

  @override
  Stream<List<ListVO>?> getOverviewBooksFromDatabase() {
    return Stream.value(getOverViewBooksMock());
  }

  @override
  Future<List<BooksVO>> getSaveBookList() {
     return Future.value(getBookList());
  }

  @override
  Stream<List<BooksVO>> getSaveBookListStream() {
    return Stream.value(getBookList());
  }

  @override
  Future<ShelfVO> renameShelf(int shelfId, String newName) {
    // TODO: implement renameShelf
    throw UnimplementedError();
  }

}