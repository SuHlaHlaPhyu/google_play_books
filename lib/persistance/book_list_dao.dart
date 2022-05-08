import '../data/vos/list_vo.dart';

abstract class BookListDao {
  void saveAllBooks(List<ListVO> bookList);
  Stream<void> getAllBookEventStream();
  List<ListVO> getAllBooks();
  Stream<List<ListVO>> getAllBooksStream();
}
