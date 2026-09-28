import 'package:flutter/material.dart';
import '../Data/bookModels.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar menampilkan judul buku
      appBar: AppBar(
        title: Text(book.title),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      // 2. Body menampilkan seluruh informasi buku
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Buku
            Center(
              child: Image.network(
                book.imageUrl,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) =>
                    const Icon(Icons.broken_image, size: 64),
              ),
            ),
            const SizedBox(height: 16),

            // Judul
            Text(
              book.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Informasi Buku
            Text('Penulis: ${book.author}'),
            const SizedBox(height: 4),
            Text('Tahun Terbit: ${book.year}'),
            const SizedBox(height: 4),
            Text('Genre: ${book.genre}'),
            const SizedBox(height: 4),
            Text('Penerbit: ${book.publisher}'),
            const SizedBox(height: 4),
            Text('Jumlah Halaman: ${book.pages} halaman'),
            const SizedBox(height: 4),
            Text('Rating: ⭐ ${book.rating} / 5.0'),

            const Divider(height: 28),

            // Deskripsi / Sinopsis
            const Text(
              'Sinopsis / Deskripsi:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              book.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
