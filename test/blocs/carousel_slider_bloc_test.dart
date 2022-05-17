import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/blocs/carousel_slider_bloc.dart';

import '../data/book_model_impl_mock.dart';
import '../mock_data/mock_data.dart';

void main(){
  group("carousel slider", (){
    CarouselSliderBloc? carouselSliderBloc;

    setUp((){
      carouselSliderBloc = CarouselSliderBloc(BookModelImplMock());
    });

    test("view book test", (){
      expect(carouselSliderBloc?.viewBookList?.contains(getBookList().first), true);
    });

  });
}