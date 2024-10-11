import 'package:flutter/material.dart';
import 'riwayat2.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HistoryScreen(),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Riwayat',
        style : TextStyle(color: Colors.white),), // Menambahkan navigasi teks "Riwayat" di atas
        backgroundColor: Colors.green[900], // Mengatur warna background AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: ListTile(
                title: Text('Riwayat Hari Ini'),
                subtitle: Text('19/4/2024'),
                onTap: () {
                  // Panggil fungsi untuk menampilkan dialog saat kartu ditekan
                  _showHistoryDialog(context);
                },
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Warna tombol DELETE
                  ),
                  onPressed: () {
                    print('Item deleted'); // Tambahkan logika untuk menghapus item
                  },
                  child: Text(
                    'Hapus',
                    style: TextStyle(color: Colors.white), // Mengubah warna teks menjadi putih
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog
  void _showHistoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Bentuk pop-up yang bulat
          ),
          contentPadding: EdgeInsets.zero, // Menghilangkan padding default AlertDialog
          content: Container(
            width: 300, // Mengatur lebar pop-up
            child: HistoryCard(), // Menampilkan HistoryCard di dalam pop-up
          ),
        );
      },
    );
  }
}
