import 'package:flutter/material.dart';
import '../Data/bookModels.dart';
import 'book_detail_page.dart';
import 'login_page.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          // Tombol Logout
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          final BookModel book = bookList[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              // Cover Buku
              leading: SizedBox(
                width: 50,
                height: 70,
                child: Image.network(
                  book.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (ctx, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              // Judul Buku
              title: Text(
                book.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // Penulis & Tahun
              subtitle: Text('${book.author} (${book.year})'),
              // Rating
              trailing: Text('⭐ ${book.rating}'),
              // Saat item ditekan -> Pindah ke Book Detail Page
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailPage(book: book),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
