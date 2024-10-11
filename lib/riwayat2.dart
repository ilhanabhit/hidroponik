import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Membatasi ukuran dialog sesuai konten
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Menambahkan jarak antara bagian atas dan teks "Riwayat hari ini"
        SizedBox(height: 20), // Jarak ditambahkan di sini
        // Menggunakan Center untuk menempatkan teks di tengah
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Riwayat hari ini',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('19/4/2024', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Image.asset(
            'assets/image/kangkung1.png', // Ganti dengan path gambar lokal
            height: 100, // Ukuran gambar
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Ketinggian air', '=  ml'),
              _buildInfoRow('Nutrisi', '=  ppm'),
              _buildInfoRow('Lampu', 'on/off'),
              _buildInfoRow('Arus air', '=  m/s'),
              _buildInfoRow('Intensitas cahaya', '=  Lux'),
              _buildInfoRow('Status', '=  '),
            ],
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog setelah ditekan
            },
            child: Text('Tutup', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Tombol CLOSE berwarna biru
            ),
          ),
        ),
        SizedBox(height: 10), // Tambahkan sedikit padding di bagian bawah
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label,
              style: TextStyle(fontSize: 14)), // Ukuran teks lebih kecil
          Text(value,
              style: TextStyle(fontSize: 14)), // Ukuran teks lebih kecil
        ],
      ),
    );
  }
}
