import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/book.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/screens/add_book_screen.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  
  const BookDetailScreen({super.key, required this.book});

  Future<void> _confirmDelete(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить книгу?'),
        content: Text('«${book.title ?? 'Без названия'}» будет удалена безвозвратно.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await FirebaseFirestore.instance
          .collection('books')
          .doc(book.id)
          .delete();
      if (context.mounted) Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 226, 221),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('О книге'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: book.covercolor,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                (book.title != null && book.title!.isNotEmpty) ? book.title![0] : '?',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              book.title ?? 'Без названия',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              '${book.author} · ${book.year}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final category in book.categories)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 162, 212, 150),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      categoryLabel(category),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 14, 100, 11),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AddBookScreen(book: book),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Редактировать'),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => _confirmDelete(context),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              icon: const Icon(Icons.delete_outline),
              label: const Text('Удалить'),
            ),
          ],
        ),
      ),
    );
  }
}