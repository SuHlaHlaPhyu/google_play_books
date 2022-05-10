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
  void createShelf(ShelfVO shelf) async{
    await getShelfBox().put(DateTime.now().millisecond, shelf);
  }

  @override
  List<ShelfVO> getAllShelf() {
    return getShelfBox().values.toList();
  }

  @override
  Stream<void> getAllShelfEventStream() {
    return getShelfBox().watch();
  }

  @override
  Stream<List<ShelfVO>> getAllShelfStream() {
    return Stream.value(getAllShelf());
  }

  @override
  void addBookToShelf(String shelfName, BooksVO book) {
    getAllShelf().map((e) {
      if(e.shelfName == shelfName){
        e.books?.add(book);
      }
    }).toList();
  }



}