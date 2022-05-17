import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/blocs/shelf_detail_bloc.dart';

import '../data/book_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group("shelf detail", (){
    ShelfDetailBloc? shelfDetailBloc;

    setUp((){
      shelfDetailBloc = ShelfDetailBloc("name",BookModelImplMock());
    });

    test("shelf detail test", (){
      expect(shelfDetailBloc?.shelf, getShelfList().first);
    });

    test("book list test", (){
      expect(shelfDetailBloc?.bookList?.contains(getBookList().first), true);
    });

  });
}