import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/blocs/view_all_ebooks_bloc.dart';

import '../data/book_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group("view all bloc", (){
    ViewAllEbooksBloc? homeBloc;

    setUp((){
      homeBloc = ViewAllEbooksBloc("name",BookModelImplMock());
    });

    test(" book list test", (){
      expect(homeBloc?.booksList?.contains(getBookList().first), true);
    });

  });
}