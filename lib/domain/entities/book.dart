import 'package:flutter/material.dart';

enum BookCategory {
  novel,
  shortstory,
  dystopia,
  fairytale,
  classic,
  sciencefiction,
  poem,
  satire
}

class Book {
  final int id;
  final String title;
  final String author;
  final int year;
  final List<BookCategory> categories;
  final Color covercolor;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.year,
    required this.categories,
    required this.covercolor
  });
}

String categoryLabel(BookCategory category) {
  switch (category) {    
    case BookCategory.novel:
      return 'Роман';
    case BookCategory.shortstory:
      return 'Рассказ';
    case BookCategory.dystopia:
      return 'Антиутопия';
    case BookCategory.fairytale:
      return 'Сказка';
    case BookCategory.classic:
      return 'Классика';
    case BookCategory.sciencefiction:
      return 'Научная фантастика';
    case BookCategory.poem:
      return 'Поэма';
    case BookCategory.satire:
      return 'Сатира';
  }
}
