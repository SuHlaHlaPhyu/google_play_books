import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:google_play_books/persistance/shelf_dao.dart';

import '../mock_data/mock_data.dart';

class ShelfDaoImplMock extends ShelfDao{

  Map<int?, ShelfVO> shelfInDatabaseMock = {};

  @override
  void addBookToShelf(BooksVO? book) {
    // TODO: implement addBookToShelf
  }

  @override
  void createShelf(ShelfVO shelf) {
    shelfInDatabaseMock[shelf.id ?? 0] = shelf;
  }

  @override
  void deleteShelf(int shelfId) {
    // TODO: implement deleteShelf
  }

  @override
  List<ShelfVO> getAllShelf() {
    return getShelfList();
  }

  @override
  Stream<void> getAllShelfEventStream() {
    return Stream<void>.value(null);
  }

  @override
  Stream<List<ShelfVO>> getAllShelfStream() {
    return Stream.value(getShelfList());
  }

  @override
  ShelfVO getBookByShelf(String name) {
    return getShelfList().first;
  }

  @override
  Stream<ShelfVO> getBookByShelfStream(String name) {
   return Stream.value(getShelfList().first);
  }

  @override
  Future<ShelfVO?> getShelfById(int shelfId) {
    return Future.value(getShelfList().first);
  }

  @override
  Future<ShelfVO> renameShelf(int shelfId, String newName) {
    // TODO: implement renameShelf
    throw UnimplementedError();
  }

}