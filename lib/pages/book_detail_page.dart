import 'package:flutter/material.dart';
import '../Data/bookModels.dart';

class BookDetailPage extends StatelessWidget {
  final BookModel book;

  const BookDetailPage({super.key, required this.book});

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.green),
          const SizedBox(width: 10),
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
          ),
          const Text(': ', style: TextStyle(color: Colors.black54)),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      // 1. AppBar menampilkan judul buku
      appBar: AppBar(
        title: Text(
          book.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover Buku dengan Shadow & Sudut Tajam (Rectangle)
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.network(
                    book.imageUrl,
                    height: 250,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 250,
                        width: 170,
                        color: Colors.grey[200],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 250,
                        width: 170,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 48,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Judul Buku
            Center(
              child: Text(
                book.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 6),

            // Penulis
            Center(
              child: Text(
                'oleh ${book.author}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Baris Rating, Genre, dan Halaman (Badge Tajam)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Rating Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 16, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        '${book.rating}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                // Genre Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Text(
                    book.genre,
                    style: TextStyle(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                // Tahun Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.teal.shade50,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Text(
                    '${book.year}',
                    style: TextStyle(
                      color: Colors.teal.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Kartu Informasi Lengkap Buku (Sudut Tajam)
            Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Informasi Buku',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const Divider(height: 18),
                    _buildInfoRow(Icons.title, 'Judul', book.title),
                    _buildInfoRow(Icons.person, 'Penulis', book.author),
                    _buildInfoRow(Icons.calendar_month, 'Tahun Terbit', '${book.year}'),
                    _buildInfoRow(Icons.category, 'Genre', book.genre),
                    _buildInfoRow(Icons.business, 'Penerbit', book.publisher),
                    _buildInfoRow(Icons.auto_stories, 'Jumlah Halaman', '${book.pages} Halaman'),
                    _buildInfoRow(Icons.star, 'Rating', '${book.rating} / 5.0'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Kartu Deskripsi / Sinopsis (Sudut Tajam)
            Card(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.description_outlined, color: Colors.green),
                        SizedBox(width: 8),
                        Text(
                          'Sinopsis',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 18),
                    Text(
                      book.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
