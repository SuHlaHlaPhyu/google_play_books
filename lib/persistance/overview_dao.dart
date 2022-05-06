import 'package:google_play_books/data/vos/list_vo.dart';

abstract class OverviewDao {
  void saveAllBooks(List<ListVO> overviewList);
  Stream<void> getAllBookEventStream();
  List<ListVO> getAllBooks();
   Stream<List<ListVO>> getAllBooksStream();
  ListVO? getMoveById(int movieId);
  Stream<ListVO?> getMovieByIdStream(int movieId);
}
