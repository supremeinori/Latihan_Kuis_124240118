import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latihan_kuis/main.dart';

void main() {
  testWidgets('Halaman Login tampil dengan elemen lengkap', (WidgetTester tester) async {
    // Bangun aplikasi
    await tester.pumpWidget(const MyApp());

    // Pastikan judul dan input tersedia
    expect(find.text('Katalog Buku'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });

  testWidgets('Validasi form saat email dan password kosong', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tekan tombol login tanpa mengisi field
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Verifikasi pesan error validasi muncul
    expect(find.text('Email tidak boleh kosong'), findsOneWidget);
  });

  testWidgets('Pesan error muncul saat login dengan kredensial salah', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Masukkan email dan password yang salah
    await tester.enterText(find.byType(TextFormField).at(0), 'user_salah@gmail.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'salah123');

    // Tekan tombol login
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    // Verifikasi SnackBar kesalahan muncul
    expect(find.text('Email atau password tidak sesuai!'), findsOneWidget);
  });
}
