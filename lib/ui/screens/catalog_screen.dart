import 'package:flutter/material.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/book.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/screens/add_book_screen.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/screens/auth_screen.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/widgets/book_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

const List<Book> catalogBooks = [
  Book(id: '1', title: 'Мастер и Маргарита', author: 'Михаил Булгаков', year: 1967, categories: [BookCategory.novel, BookCategory.classic], covercolor: Color.fromARGB(255, 219, 114, 114),),
  Book(id: '2', title: 'Пикник на обочине', author: 'Аркадий и Борис Стругацкие', year: 1972, categories: [BookCategory.sciencefiction], covercolor: Color.fromARGB(255, 212, 161, 93)),
  Book(id: '3', title: '1984', author: 'Джордж Оруэлл', year: 1948, categories: [BookCategory.dystopia, BookCategory.classic], covercolor: Color.fromARGB(255, 209, 201, 82)),
  Book(id: '4', title: 'Маленький принц', author: 'Антуан де Сент-Экзюпери', year: 1942, categories: [BookCategory.fairytale], covercolor: Color.fromARGB(255, 161, 160, 71)),
  Book(id: '5', title: 'Над пропастью во ржи', author: 'Джером Сэлинджер', year: 1951, categories: [BookCategory.novel, BookCategory.classic], covercolor: Color.fromARGB(255, 139, 175, 73)),
  Book(id: '6', title: 'Божественная комедия', author: 'Данте Алигьери', year: 1308, categories: [BookCategory.poem, BookCategory.classic], covercolor: Color.fromARGB(255, 65, 165, 152)),
  Book(id: '7', title: 'Сто лет одиночества', author: 'Габриэль Гарсиа Маркес', year: 1967, categories: [BookCategory.novel, BookCategory.classic], covercolor: Color.fromARGB(255, 95, 120, 204)),
  Book(id: '8', title: 'Бойня номер пять, или Крестовый поход детей', author: 'Курт Воннегут', year: 1969, categories: [BookCategory.satire], covercolor: Color.fromARGB(255, 171, 88, 204)),
  ];

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreen();
}

class _CatalogScreen extends State<CatalogScreen> {
  final Set<String> favoriteIds = {};
  bool _showFavoritesOnly = false;

  final _itemsStream =
      FirebaseFirestore.instance.collection('books').snapshots();
  
  void _toggleFilter() {
    setState(() {
      _showFavoritesOnly = !_showFavoritesOnly;
    });
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(builder: (_) => const AuthScreen())
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 226, 221),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Каталог книг',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: _itemsStream,
                  builder: (context, snapshot) {
                    final count = snapshot.data?.docs.length ?? 0;
                    return Text(
                      'В каталоге: $count',
                      style:
                          const TextStyle(fontSize: 14, color: Colors.grey),
                    );
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  'В избранном: ${favoriteIds.length}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              _showFavoritesOnly ? Icons.favorite : Icons.filter_list,
              color: _showFavoritesOnly ? Colors.red : null,
            ),
            tooltip: _showFavoritesOnly
                ? 'Показать все книги'
                : 'Показать только избранные',
            onPressed: _toggleFilter,
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
            onPressed: _logout,
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AddBookScreen()),
          );
        },
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _itemsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Ошибка: ${snapshot.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          final allBooks = snapshot.data!.docs
              .map((doc) => Book.fromFirestore(doc))
              .toList();
          final displayedBooks = _showFavoritesOnly
              ? allBooks.where((b) => favoriteIds.contains(b.id)).toList()
              : allBooks;

          if (displayedBooks.isEmpty) {
            return const Center(
              child: Text('Пока пусто. Добавьте первую книгу.'),
            );
          }

          return ListView.builder(
            itemCount: displayedBooks.length,
            itemBuilder: (context, index) {
              final book = displayedBooks[index];
              return BookCard(
                book: book,
                isFavorite: favoriteIds.contains(book.id),
                onFavoriteToggle: () {
                  setState(() {
                    if (favoriteIds.contains(book.id)) {
                      favoriteIds.remove(book.id);
                    } else {
                      favoriteIds.add(book.id);
                    }
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}