import 'package:flutter/material.dart';
import 'kendali.dart'; // Import halaman Kendali
import 'beranda.dart'; // Import halaman Beranda
import 'riwayat.dart'; // Import halaman Riwayat
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(), // Ubah home ke LoginScreen untuk halaman pertama
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // Set Beranda (index 1) sebagai halaman awal

  // Daftar halaman yang akan ditampilkan berdasarkan indeks
  final List<Widget> _pages = [
    ControlPage(), // Halaman Kendali
    HomeScreen(), // Halaman Beranda
    HistoryScreen(), // Halaman Riwayat
  ];

  // Fungsi untuk mengganti halaman berdasarkan indeks yang dipilih
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex], // Menampilkan halaman berdasarkan indeks yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Menangani onTap untuk berpindah halaman
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Kendali',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
      ),
    );
  }
}
