import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/bloc/books_events.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/bloc/books_state.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/book.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc() : super(BooksLoadInProgress()) {
    on<BooksLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
    BooksLoadRequested event,
    Emitter<BooksState> emit,
  ) async {
    emit(BooksLoadInProgress());
    await emit.forEach(
      FirebaseFirestore.instance.collection('books').snapshots(),
      onData: (snapshot) => BooksLoadSuccess(
        snapshot.docs.map(Book.fromFirestore).toList(),
      ),
      onError: (error, stackTrace) =>
          BooksLoadFailure('Не удалось загрузить каталог'),
    );
  }
}
