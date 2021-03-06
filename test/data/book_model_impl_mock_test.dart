import 'package:flutter_test/flutter_test.dart';
import 'package:google_play_books/data/models/book_model_impl.dart';
import 'package:google_play_books/data/vos/books_vo.dart';
import 'package:google_play_books/data/vos/list_vo.dart';
import 'package:google_play_books/data/vos/shelf_vo.dart';

import '../mock_data/mock_data.dart';
import '../network/play_books_data_agent_impl_mock.dart';
import '../persistance/book_dao_impl_mock.dart';
import '../persistance/book_list_dao_impl_mock.dart';
import '../persistance/save_book_dao_impl_mock.dart';
import '../persistance/shelf_dao_impl_mock.dart';

void main() {
  group("play books test", () {
    var bookModel = BookModelImpl();

    setUp(
      () {
        bookModel.setDaosAndDataAgents(
          BookDaoImplMock(),
          SaveBookDaoImplMock(),
          BookListDaoImplMock(),
          ShelfDaoImplMock(),
          PlayBooksDataAgentImplMock(),
        );
      },
    );

    test("over view books list", () {
      expect(
          bookModel.getOverviewBooksFromDatabase(),
          emits([
            ListVO(
              12,
              "Fiction",
              null,
              null,
              null,
              null,
              null,
              null,
              [
                BooksVO(
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "description",
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "Marketing",
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "news",
                ),
              ],
            ),
            ListVO(
              22,
              "Electronic",
              null,
              null,
              null,
              null,
              null,
              null,
              [
                BooksVO(
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "description details",
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "Programming",
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "news",
                ),
              ],
            ),
          ]));
    });

    test("shelf list", () {
      expect(
          bookModel.getAllShelfStream(),
          emits([
            ShelfVO(
                "programming",
                [
                  BooksVO(
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    "description",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    "Marketing",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    "news",
                  ),
                ],
                false,
                100),
            ShelfVO(
                "food",
                [
                  BooksVO(
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    "description details",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    "Programming",
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    null,
                    "news",
                  ),
                ],
                false,
                130),
          ]));
    });

    test("book by shelf stream", () {
      expect(
        bookModel.getBookByShelfStream("name"),
        emits(
          ShelfVO(
              "programming",
              [
                BooksVO(
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "description",
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "Marketing",
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  null,
                  "news",
                ),
              ],
              false,
              100),
        ),
      );
    });

    test("book detail", () {
      expect(
          bookModel.getBookDetails("name"),
          completion(
            equals(getBookList().first),
          ));
    });

    test("save book list stream", () {
      expect(
          bookModel.getSaveBookListStream(),
          emits([
            BooksVO(
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              "description",
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              "Marketing",
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              "news",
            ),
            BooksVO(
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              "description details",
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              "Programming",
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              "news",
            ),
          ]));
    });

  });
}
