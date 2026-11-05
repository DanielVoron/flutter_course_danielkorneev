import 'package:flutter/material.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/book.dart';
import 'package:flutter_course_hws_korneevdaniel/ui/widgets/book_card.dart';

const List<Book> catalogBooks = [
  Book(id: 1, title: 'Мастер и Маргарита', author: 'Михаил Булгаков', year: 1967, categories: [BookCategory.novel, BookCategory.classic], covercolor: Color.fromARGB(255, 219, 114, 114),),
  Book(id: 2, title: 'Пикник на обочине', author: 'Аркадий и Борис Стругацкие', year: 1972, categories: [BookCategory.sciencefiction], covercolor: Color.fromARGB(255, 212, 161, 93)),
  Book(id: 3, title: '1984', author: 'Джордж Оруэлл', year: 1948, categories: [BookCategory.dystopia, BookCategory.classic], covercolor: Color.fromARGB(255, 209, 201, 82)),
  Book(id: 4, title: 'Маленький принц', author: 'Антуан де Сент-Экзюпери', year: 1942, categories: [BookCategory.fairytale], covercolor: Color.fromARGB(255, 161, 160, 71)),
  Book(id: 5, title: 'Над пропастью во ржи', author: 'Джером Сэлинджер', year: 1951, categories: [BookCategory.novel, BookCategory.classic], covercolor: Color.fromARGB(255, 139, 175, 73)),
  Book(id: 6, title: 'Божественная комедия', author: 'Данте Алигьери', year: 1308, categories: [BookCategory.poem, BookCategory.classic], covercolor: Color.fromARGB(255, 65, 165, 152)),
  Book(id: 7, title: 'Сто лет одиночества', author: 'Габриэль Гарсиа Маркес', year: 1967, categories: [BookCategory.novel, BookCategory.classic], covercolor: Color.fromARGB(255, 95, 120, 204)),
  Book(id: 8, title: 'Бойня номер пять, или Крестовый поход детей', author: 'Курт Воннегут', year: 1969, categories: [BookCategory.satire], covercolor: Color.fromARGB(255, 171, 88, 204)),
  ];

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreen();
}

class _CatalogScreen extends State<CatalogScreen> {
  final Set<int> favoriteIds = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 226, 221),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Каталог книг',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),              
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'В каталоге: ${catalogBooks.length}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(width: 8,),
                Text(
                  'В избранном: ${favoriteIds.length}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                )            
              ],
            )
          ],
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: catalogBooks.length,
        itemBuilder: (context, index) {
          final book = catalogBooks[index];
          return BookCard(
            book: book,
            isFavorite: favoriteIds.contains(book.id),
            onFavoriteToggle: () {
              setState(() {
                if (favoriteIds.contains(book.id)) {
                  favoriteIds.remove(book.id);
                }
                else {
                  favoriteIds.add(book.id);
                }
              });
            }
            );
        },
      )
    );
  }
}