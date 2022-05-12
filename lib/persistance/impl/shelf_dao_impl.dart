import 'package:collection/collection.dart';
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
    await getShelfBox().put(shelf.id, shelf);
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
  void addBookToShelf(BooksVO? book){
     book?.time = DateTime.now().millisecond;
    List<ShelfVO>? selectShelf =  getAllShelf().where((element) => element.selected == true).toList();
    List<int?> id = selectShelf.map((e) => e.id).toList();
    selectShelf.mapIndexed((index,e) {
      e.books?.add(book!);
      getShelfBox().put(id[index], e);
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

  @override
  Future<ShelfVO> renameShelf(int shelfId, String newName) async{
    return getShelfById(shelfId).then((value) {
      value?.shelfName = newName;
      getShelfBox().put(shelfId, value!);
      return Future.value(value);
    });
  }

  @override
  Future<ShelfVO?> getShelfById(int shelfId) {
    return Future.value(getShelfBox().get(shelfId));
  }

  @override
  void deleteShelf(int shelfId) {
    getShelfBox().delete(shelfId);
  }


}