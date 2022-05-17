import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/blocs/home_bloc.dart';

import '../data/book_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group("home bloc", (){
    HomeBloc? homeBloc;

    setUp((){
      homeBloc = HomeBloc(BookModelImplMock());
    });

    test("view book test", (){
      expect(homeBloc?.viewBookList?.contains(getBookList().first), true);
    });

    test("overview list book test", (){
      expect(homeBloc?.overviewBooksList?.contains(getOverViewBooksMock().first), true);
    });

  });
}