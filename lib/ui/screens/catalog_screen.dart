// lib/ui/screens/catalog_screen.dart

import 'package:flutter/material.dart';
import '../../domain/entities/book.dart';
import '../widgets/book_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  // Список книг — константа вне build, как требовалось
  static const List<Book> _books = [
    Book(
      id: 1,
      title: 'Мастер и Маргарита',
      subtitle: 'Роман Михаила Булгакова, написанный в 1967',
      category: BookCategory.fiction,
      description: 'Классика',
    ),
    Book(
      id: 2,
      title: 'Пикник на обочине',
      subtitle: 'Аркадий и Борис Стругацкие - 1972',
      category: BookCategory.fiction,
      description: 'Фантастика',
    ),
    Book(
      id: 3,
      title: '1984',
      subtitle: 'Джордж Оруэлл - 1949',
      category: BookCategory.fiction,
      description: 'Антиутопия',
    ),
    Book(
      id: 4,
      title: 'Маленький принц',
      subtitle: 'Антуан де Сент-Экзюпери - 1943',
      category: BookCategory.fiction,
      description: 'Сказка',
    ),
    Book(
      id: 5,
      title: 'Над пропастью во ржи',
      subtitle: 'Джером Сэлинджер - 1951',
      category: BookCategory.fiction,
    ),
    Book(
      id: 6,
      title: 'Божественная комедия',
      subtitle: 'Данте Алигьери - 1321',
      category: BookCategory.fiction,
      description: 'Поэма',
    ),
    Book(
      id: 7,
      title: 'Сто лет одиночества',
      subtitle: 'Габриэль Гарсиа Маркес - 1967',
      category: BookCategory.fiction,
      description: 'Роман',
    ),
    Book(
      id: 8,
      title: 'Бойня номер пять, или Крестовый поход детей',
      subtitle: 'Курт Воннегут - 1969',
      category: BookCategory.fiction,
      description: 'Сатира',
    ),
    Book(
      id: 9,
      title: 'Норвежский лес',
      subtitle: 'Харуки Мураками',
      category: BookCategory.fiction,
      description: 'Классика',
    ),
  ];

  final Set<int> _likedIds = {};
  bool _showOnlyFavorites = false;

  void _toggleLike(int id) {
    setState(() {
      if (_likedIds.contains(id)) {
        _likedIds.remove(id);
      } else {
        _likedIds.add(id);
      }
    });
  }

  List<Book> get _filteredBooks {
    if (!_showOnlyFavorites) return _books;
    return _books.where((b) => _likedIds.contains(b.id)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCount = _likedIds.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F4F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Список книг',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              _showOnlyFavorites
                  ? 'В избранном: $favoriteCount'
                  : '${_books.length} книг в каталоге',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            tooltip: 'Только избранное',
            onPressed: () {
              setState(() {
                _showOnlyFavorites = !_showOnlyFavorites;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: _filteredBooks.length,
          itemBuilder: (context, index) {
            final book = _filteredBooks[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: BookCard(
                book: book,
                isLiked: _likedIds.contains(book.id),
                onLikeTap: () => _toggleLike(book.id),
              ),
            );
          },
        ),
      ),
    );
  }
}
