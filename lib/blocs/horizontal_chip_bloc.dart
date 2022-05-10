import 'package:flutter/foundation.dart';
import 'package:google_play_books/data/models/book_model.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';

class HorizontalChipBloc extends ChangeNotifier {
  /// States
  List<bool>? selectedChip;
  bool isShow = false;

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

  void isSelect (int index){
    selectedChip?[index] = true;
    isShow = true;
    notifyListeners();
  }

  void setToDefault(){
    isShow = false;
    bookModel.getSaveBookList().then((value) {
      selectedChip = value.map((e) => false).toList();
      notifyListeners();
    }).catchError((error) {
      //
    });
    notifyListeners();
  }
}
