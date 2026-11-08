import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/bloc/books_bloc.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/bloc/books_events.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/bloc/books_state.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/screens/add_book_screen.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/screens/auth_screen.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/screens/book_detail_screen.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/widgets/book_card.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreen();
}

class _CatalogScreen extends State<CatalogScreen> {
  final Set<String> favoriteIds = {};
  bool _showFavoritesOnly = false;
  final _searchContoller = TextEditingController();
  String _searchQuery = '';

  void _toggleFilter() {
    setState(() {
      _showFavoritesOnly = !_showFavoritesOnly;
    });
  }
  
  @override
  void dispose() {
    _searchContoller.dispose();
    super.dispose();
  }

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(builder: (_) => const AuthScreen()),
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
                BlocBuilder<BooksBloc, BooksState>(
                  builder: (context, state) {
                    final count =
                        state is BooksLoadSuccess ? state.count : 0;
                    return Text(
                      'В каталоге: $count',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
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
            body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
            child: TextField(
              controller: _searchContoller,
              decoration: const InputDecoration(
                hintText: 'Поиск по названию',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          Expanded(
            child: BlocBuilder<BooksBloc, BooksState>(
              builder: (context, state) {
                if (state is BooksLoadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is BooksLoadFailure) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.message),
                        const SizedBox(height: 12),
                        FilledButton(
                          onPressed: () =>
                              context.read<BooksBloc>().add(BooksLoadRequested()),
                          child: const Text('Обновить'),
                        ),
                      ],
                    ),
                  );
                }

                final books = (state as BooksLoadSuccess).books;
                final query = _searchQuery.trim().toLowerCase();

                var displayedBooks = books;
                if (_showFavoritesOnly) {
                  displayedBooks = displayedBooks
                      .where((b) => favoriteIds.contains(b.id))
                      .toList();
                }
                if (query.isNotEmpty) {
                  displayedBooks = displayedBooks
                      .where((b) => (b.title ?? '').toLowerCase().contains(query))
                      .toList();
                }

                if (displayedBooks.isEmpty) {
                  // различаем «каталог пуст» и «поиск ничего не нашёл»
                  final isSearchEmpty =
                      books.isNotEmpty && (query.isNotEmpty || _showFavoritesOnly);
                  return Center(
                    child: Text(
                      isSearchEmpty
                          ? 'Ничего не найдено'
                          : 'Пока пусто. Добавьте первую книгу.',
                    ),
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
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BookDetailScreen(book: book),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}