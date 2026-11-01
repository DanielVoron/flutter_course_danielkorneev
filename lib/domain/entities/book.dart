// lib/domain/entities/book.dart

enum BookCategory {
  fiction,
  nonFiction,
  science,
  history,
  programming,
}

class Book {
  final int id;
  final String title;
  final String subtitle;
  final BookCategory category;
  final String? description;

  const Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    this.description,
  });
}
