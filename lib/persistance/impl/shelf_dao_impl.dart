import 'package:google_play_books/data/vos/shelf_vo.dart';
import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:google_play_books/persistance/shelf_dao.dart';
import 'package:hive/hive.dart';

import '../../data/vos/books_vo.dart';

class ShelfDaoImpl extends ShelfDao{

  static final ShelfDaoImpl _singleton = ShelfDaoImpl._internal();

  factory ShelfDaoImpl() {
    return _singleton;
  }

  ShelfDaoImpl._internal();

  Box<ShelfVO> getShelfBox() {
    return Hive.box<ShelfVO>(BOX_NAME_SHELF_VO);
  }

  @override
  Stream<void> getAllShelfEventStream() {
    return getShelfBox().watch();
  }

  @override
  void createShelf(ShelfVO shelf) async{
    await getShelfBox().put(DateTime.now().millisecond, shelf);
  }

  @override
  List<ShelfVO> getAllShelf() {
    return getShelfBox().values.toList();
  }

  @override
  Stream<List<ShelfVO>> getAllShelfStream() {
    return Stream.value(getAllShelf());
  }

  @override
  void addBookToShelf(BooksVO? book) {
    List<ShelfVO>? selectShelf =  getAllShelf().where((element) => element.selected == true).toList();
    List<ShelfVO>? temp = selectShelf.map((e) {
      e.books?.add(book!);
      return e;
    }).toList();
  }

  @override
  ShelfVO getBookByShelf(String name) {
    return getAllShelf().where((e) => e.shelfName == name).toList().first;
  }

  @override
  Stream<ShelfVO> getBookByShelfStream(String name) {
    return Stream.value(getBookByShelf(name));
  }

}