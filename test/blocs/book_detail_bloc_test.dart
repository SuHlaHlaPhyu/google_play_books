import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/blocs/book_detail_bloc.dart';

import '../data/book_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group("book detail", (){
    BookDetailBloc? bookDetailBloc;

    setUp((){
      bookDetailBloc = BookDetailBloc("title","category",BookModelImplMock());
    });

    test("book detail test", (){
      expect(bookDetailBloc?.bookDetail, getBookList().first);
    });

    test("similar books test", (){
      expect(bookDetailBloc?.similarBook?.contains(getBookList().first), true);
    });


  });
}