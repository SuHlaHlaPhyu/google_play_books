import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/blocs/shelf_bloc.dart';

import '../data/book_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group("shelf", (){
    ShelfBloc? shelfBloc;

    setUp((){
      shelfBloc = ShelfBloc(BookModelImplMock());
    });

    test("shelf test", (){
      expect(shelfBloc?.shelfList?.contains(getShelfList().first), true);
    });

  });
}