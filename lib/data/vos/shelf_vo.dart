import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/persistance/hive_constant.dart';
import 'package:hive/hive.dart';


part 'shelf_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_SHELF_VO, adapterName: "ShelfVOAdapter")
class ShelfVO {

  @HiveField(0)
  String? shelfName;

  @HiveField(1)
  List<BooksVO>? books;

  @HiveField(2)
  bool? selected;

  @HiveField(3)
  int? id;

  ShelfVO(this.shelfName, this.books, this.selected, this.id);

  @override
  String toString() {
    return 'ShelfVO{shelfName: $shelfName, books: $books, selected: $selected, id: $id}';
  }
}
