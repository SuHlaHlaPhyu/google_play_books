import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';

class HorizontalChipBloc extends ChangeNotifier {
  /// States
  List<bool>? selectedChip;
  bool isShow = false;
  int count = 0;

  BookModel bookModel = BookModelImpl();
  HorizontalChipBloc() {
    /// overview books
    bookModel.getSaveBookList().then((value) {
      selectedChip = value.map((e) => false).toList();
      notifyListeners();
    }).catchError((error) {
      //
    });
  }

  void isSelect(List<String?> chipList, int index) {
    count += 1;
    String item = chipList.elementAt(index) ?? "";
    chipList.removeAt(index);
    chipList.insert(0, item);
    for(int i=0; i< count ; i++){
      selectedChip?[i] = true;
    }
    isShow = true;
    notifyListeners();
  }

  void setToDefault() {
    isShow = false;
    count = 0;
    bookModel.getSaveBookList().then((value) {
      selectedChip = value.map((e) => false).toList();
      notifyListeners();
    }).catchError((error) {
      //
    });
    notifyListeners();
  }
}
