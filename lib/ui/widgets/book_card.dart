// lib/ui/widgets/book_card.dart

import 'package:flutter/material.dart';
import '../../domain/entities/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const BookCard({
    super.key,
    required this.book,
    required this.isLiked,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    // Вспомогательная функция для получения названия категории
    String categoryName(BookCategory category) {
      switch (category) {
        case BookCategory.fiction:
          return 'Художественная';
        case BookCategory.nonFiction:
          return 'Нон-фикшн';
        case BookCategory.science:
          return 'Наука';
        case BookCategory.history:
          return 'История';
        case BookCategory.programming:
          return 'Программирование';
      }
    }

    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                  color: _categoryColor(book.category),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
              ),
              Icon(
                Icons.book,
                color: _iconColor(book.category),
                size: 60,
              ),
              Positioned(
                top: 4,
                right: -8,
                child: IconButton(
                  onPressed: onLikeTap,
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    _badge(categoryName(book.category)),
                    if (book.description != null) _badge(book.description!),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Color _categoryColor(BookCategory category) {
    switch (category) {
      case BookCategory.fiction:
        return const Color(0xFF943725);
      case BookCategory.nonFiction:
        return const Color(0xFF317074);
      case BookCategory.science:
        return const Color.fromARGB(255, 91, 104, 148);
      case BookCategory.history:
        return const Color.fromARGB(255, 216, 166, 57);
      case BookCategory.programming:
        return const Color.fromARGB(255, 47, 109, 124);
    }
  }

  Color _iconColor(BookCategory category) {
    switch (category) {
      case BookCategory.fiction:
        return const Color(0xFFCEA69E);
      case BookCategory.nonFiction:
        return const Color.fromARGB(183, 119, 213, 236);
      case BookCategory.science:
        return const Color.fromARGB(213, 133, 175, 214);
      case BookCategory.history:
        return const Color.fromARGB(255, 231, 207, 175);
      case BookCategory.programming:
        return const Color.fromARGB(255, 138, 205, 221);
    }
  }
}
