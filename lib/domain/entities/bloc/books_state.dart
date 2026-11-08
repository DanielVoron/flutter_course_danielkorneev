import 'package:flutter_course_hws_korneevdaniel/domain/entities/book.dart';

sealed class BooksState {}

class BooksLoadInProgress extends BooksState {}

class BooksLoadSuccess extends BooksState {
  final List<Book> books;

  BooksLoadSuccess(this.books);

  int get count => books.length;
}

class BooksLoadFailure extends BooksState {
  final String message;

  BooksLoadFailure(this.message);
}
