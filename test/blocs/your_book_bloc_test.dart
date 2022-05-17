import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/blocs/your_book_bloc.dart';

import '../data/book_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group("your books bloc", (){
    YourBookBloc? yourBookBloc;

    setUp((){
      yourBookBloc = YourBookBloc(BookModelImplMock());
    });

    test(" book list test", (){
      expect(yourBookBloc?.viewBookList?.contains(getBookList().first), true);
    });

  });
}