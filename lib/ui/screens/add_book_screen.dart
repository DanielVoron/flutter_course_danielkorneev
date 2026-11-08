import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_hws_korneevdaniel/domain/entities/book.dart';

class AddBookScreen extends StatefulWidget {
  final Book? book;

  const AddBookScreen({super.key, this.book});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _yearController = TextEditingController();
  final Set<BookCategory> _selectedCategories = {};
  Color _color = const Color.fromARGB(255, 219, 114, 114);
  bool _saving = false;

  static const _palette = [
    Color.fromARGB(255, 219, 114, 114),
    Color.fromARGB(255, 212, 161, 93),
    Color.fromARGB(255, 209, 201, 82),
    Color.fromARGB(255, 139, 175, 73),
    Color.fromARGB(255, 65, 165, 152),
    Color.fromARGB(255, 95, 120, 204),
    Color.fromARGB(255, 171, 88, 204),
  ];

 @override
  void initState() {
    super.initState();
    final book = widget.book;
    if (book != null) {
      _titleController.text = book.title ?? '';
      _authorController.text = book.author ?? '';
      _yearController.text = book.year.toString();
      _selectedCategories.addAll(book.categories);
      _color = book.covercolor;
    }
  }

   Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final book = Book(
        id: widget.book?.id ?? '',
        title: _titleController.text.trim(),
        author: _authorController.text.trim(),
        year: int.tryParse(_yearController.text) ?? 0,
        categories: _selectedCategories.toList(),
        covercolor: _color,
      );
      final collection = FirebaseFirestore.instance.collection('books');
      if (widget.book != null) {
        await collection.doc(widget.book!.id).update(book.toJson());
      } else {
        await collection.add(book.toJson());
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.book != null;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 226, 221),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(isEditing ? 'Редактирование' : 'Новая книга'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Название',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Введите название' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(
                  labelText: 'Автор',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Введите автора' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _yearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Год',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    int.tryParse(v ?? '') == null ? 'Введите год числом' : null,
              ),
              const SizedBox(height: 16),
              const Text('Категории'),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  for (final c in BookCategory.values)
                    FilterChip(
                      label: Text(categoryLabel(c)),
                      selected: _selectedCategories.contains(c),
                      onSelected: (selected) {
                        setState(() {
                          selected
                              ? _selectedCategories.add(c)
                              : _selectedCategories.remove(c);
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Цвет обложки'),
              Wrap(
                spacing: 8,
                children: [
                  for (final c in _palette)
                    GestureDetector(
                      onTap: () => setState(() => _color = c),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: c,
                          shape: BoxShape.circle,
                          border: _color == c
                              ? Border.all(width: 3, color: Colors.black)
                              : null,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _saving ? null : _save,
                child: _saving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Сохранить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
