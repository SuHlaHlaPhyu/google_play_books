import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/data/models/search_model_impl.dart';

import '../mock_data/mock_data.dart';
import '../network/google_data_agent_impl_mock.dart';
import '../persistance/book_dao_impl_mock.dart';

void main() {
  group("play books test", () {
    var bookModel = SearchModelImpl();

    setUp(
          () {
        bookModel.setDaosAndDataAgents(
          BookDaoImplMock(),
          GoogleDataAgentImplMock(),
        );
      },
    );

    test("book by search list", () {
      expect(
          bookModel.searchBook("text"),
          completion(equals(getBookList())));
    });
  });
}
