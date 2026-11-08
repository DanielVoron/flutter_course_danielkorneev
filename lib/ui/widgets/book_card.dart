import 'package:flutter/material.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/book.dart';


class BookCard extends StatelessWidget {
  final Book book;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback? onTap;

  const BookCard({
    super.key,
    required this.book,
    required this.isFavorite,
    required this.onFavoriteToggle,
    this.onTap,
  });
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      child:  InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(     
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(76, 0, 0, 0),
                blurRadius: 5,
                spreadRadius: 0,
                offset: const Offset(5, 5)
              )
            ] 
          ),
          // Создается ряд в котором иконка, название, описание и тэги
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              // контейнер с иконкой
              Container(
                width: 80,
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: book.covercolor,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
        
                      // здесь должна передаваться первая буква названия
                      child: Text(
                        (book.title != null && book.title!.isNotEmpty) ? book.title![0] : '?',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withValues(alpha: 0.5),
                        ),
                      )
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: InkWell(
                        onTap: onFavoriteToggle, // просто передаём колбэк наверх
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(60, 0, 0, 0),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 20,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
              //отступ между элементами ряда
              SizedBox(width: 8,),
        
              // Создается колонка в Expanded в которой название, описание и тэги
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title ?? 'Без названия',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),                    
                      Text(
                        '${book.author} - ${book.year}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                        ),
                      ),
                    SizedBox(height: 10,),                    
                    // создание тэгов
                    Wrap(
                      spacing: 2,
                      runSpacing: 8,
                      children: [
                        for (var category in book.categories)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 162, 212, 150),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            margin: const EdgeInsets.only(right: 8),
                            child: Text(
                              categoryLabel(category),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 14, 100, 11),
                              ),
                            ),
                          )                
                      ],
                    )
                  ],
                )),
            ],
          ),
        ),
      ),
    );
  }
}