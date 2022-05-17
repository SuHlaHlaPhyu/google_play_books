import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/blocs/add_to_shelf_bloc.dart';

import '../data/book_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group("add to shelf", (){
    AddToShelfBloc? addToShelfBloc;

    setUp((){
      addToShelfBloc = AddToShelfBloc(BookModelImplMock());
    });

    test("add to shelf test", (){
      expect(addToShelfBloc?.shelfList?.contains(getShelfList().first), true);
    });

  });
}