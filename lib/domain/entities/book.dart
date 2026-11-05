import 'package:cloud_firestore/cloud_firestore.dart';
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
  final String id;
  final String? title;
  final String? author;
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

  factory Book.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  final data = doc.data()!;
  return Book(
    id: doc.id,
    title: data['title'] as String? ?? 'Без названия',
    author: data['author'] as String? ?? 'Неизвестен',
    year: (data['year'] as num?)?.toInt() ?? 0,
    categories: (data['categories'] as List<dynamic>? ?? [])
        .map((e) => BookCategory.values.byName(e.toString()))
        .toList(),
    covercolor: Color(data['covercolor'] as int? ?? 0xFFCCCCCC),
  );
}

  Map<String, dynamic> toJson() => {
    'title': title,
    'author': author,
    'year': year,
    'categories': categories.map((c) => c.name).toList(),
    'covercolor': covercolor.toARGB32(),
  };
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
