import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';

abstract class ShelfDao {
  void createShelf(ShelfVO shelf);
  void addBookToShelf(BooksVO? book);
  Stream<void> getAllShelfEventStream();
  List<ShelfVO> getAllShelf();
  Stream<List<ShelfVO>> getAllShelfStream();
  ShelfVO getBookByShelf(String name);
  Stream<ShelfVO> getBookByShelfStream(String name);
  Future<ShelfVO?> getShelfById(int shelfId);
  Future<ShelfVO> renameShelf(int shelfId, String newName);
}
