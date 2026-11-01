import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
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
                  color: Colors.black
                ),),
                Text(
                  '9 книг в каталоге',                
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey                    
                  ),)
            ],
          )),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [            
            Column(
              spacing: 16,
              children: [
                //книга 1
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xFF943725),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color(0xFFCEA69E), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    spacing: 2,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Мастер и Маргарита',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Роман Михаила Булгакова, написанный в 1967',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Роман',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Классика',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              ),
              // КНИГА 2
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color(0xFF317074),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color.fromARGB(183, 119, 213, 236), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    spacing: 2,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Пикник на обочине',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Аркадий и Борис Стругацкие - 1972',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Фантастика',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Повесть',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              ),
              // КНИГА 3
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 91, 104, 148),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color.fromARGB(213, 133, 175, 214), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    spacing: 2,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '1984',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Джордж Оруэлл - 1949',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Антиутопия',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Классика',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              ),
              // КНИГА 4
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 216, 166, 57),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color.fromARGB(255, 231, 207, 175), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Маленький принц',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Антуан де Сент-Экзюпери - 1943',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Сказка',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Притча',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              ),
              //КНИГА5
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 102, 71, 114),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color.fromARGB(255, 194, 150, 214), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Над пропастью во ржи',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Джером Сэлиджер - 1951',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Роман',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),                          
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              ),
              // КНИГА 6
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 96, 114, 68),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color.fromARGB(255, 157, 194, 157), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Божественная комедия',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Данте Алигьери - 1321',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Поэма',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),                          
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              ),
              //КНИГА 7
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 47, 109, 124),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color.fromARGB(255, 138, 205, 221), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Сто лет одиночества',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        'Габриэль Гарсиа Маркес - 1967',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Роман',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              ),
              //КНИГА 8
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 41, 97, 44),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color.fromARGB(255, 83, 139, 85), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Бойня номер пять, или Крестовый поход детей',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        '	Курт Воннегут - 1969',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Роман',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'Сатира',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              ),
              //КНИГА 9
              Container(              
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16),)
              ),
              child: Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 180, 162, 59),
                          borderRadius: BorderRadius.all(Radius.circular(16))
                        ),                        
                      ),
                      Icon(Icons.book, color: Color.fromARGB(255, 211, 210, 146), size: 60,),
                      Positioned(
                        top: 4,
                        right: -8,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(8)
                          ),
                          child: Icon(Icons.favorite_border, color: Colors.grey,)))
                    ],
                  ),
                  Expanded(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Норвежский лес',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        ),
                      Text(
                        '	Харуки Мураками - 1987',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: const Text(
                              'Роман',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                         
                        ],
                      )
                    ],
                  ))                  
                ],
              ),
              )          
            ],)
          ],
        ),
      ),
    );
  }
}
