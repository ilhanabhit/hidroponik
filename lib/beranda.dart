import 'package:flutter/material.dart';
import 'profil.dart'; // Pastikan file profil.dart sudah ada
import 'package:intl/intl.dart'; // Untuk format tanggal dan waktu
import 'dart:async'; // Untuk menggunakan Timer

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Menggunakan HomeScreen sebagai layar utama
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentTime = '';
  String _nutrisiStatus = 'Tersedia';
  String _intensitasCahaya = '00 cd';
  String _ketinggianAir = 'Normal';

  @override
  void initState() {
    super.initState();
    _updateTime(); // Memperbarui waktu saat layar terbuka
    Timer.periodic(Duration(minutes: 1),
        (Timer t) => _updateTime()); // Memperbarui waktu setiap menit
    Timer.periodic(Duration(seconds: 10),
        (Timer t) => _checkStatus()); // Cek status setiap 10 detik
  }

  void _updateTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('EEEE, d MMMM yyyy, HH:mm').format(now);
    setState(() {
      _currentTime = formattedTime;
    });
  }

  // Fungsi untuk mengecek status nutrisi, intensitas cahaya, dan ketinggian air
  void _checkStatus() {
    // Contoh: logika untuk memeriksa perubahan status (disesuaikan dengan sistem nyata)
    String newNutrisiStatus = 'Hampir Habis'; // Simulasi status nutrisi berubah
    String newIntensitasCahaya = '500 cd'; // Simulasi intensitas cahaya berubah
    String newKetinggianAir = 'Tinggi'; // Simulasi ketinggian air berubah

    if (newNutrisiStatus != _nutrisiStatus) {
      setState(() {
        _nutrisiStatus = newNutrisiStatus;
      });
    }

    if (newIntensitasCahaya != _intensitasCahaya) {
      setState(() {
        _intensitasCahaya = newIntensitasCahaya;
      });
    }

    if (newKetinggianAir != _ketinggianAir) {
      setState(() {
        _ketinggianAir = newKetinggianAir;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Beranda',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[800], // Warna sesuai tema hidroponik
        actions: [
          IconButton(
            icon: Icon(Icons.person,
                color: Colors.white), // Ikon untuk navigasi ke profil
            onPressed: () {
              _showProfile(context); // Navigasi ke profil
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Hai, Farid!\nSelamat Datang Di',
                          textAlign: TextAlign.left, // Meratakan ke kiri
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900], // Warna hijau yang kuat
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 26.0),
                          child: Image.asset(
                            'assets/image/logo2.png',
                            fit: BoxFit.cover,
                            height: 30, // Sesuaikan ukuran gambar
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error,
                                  color: Colors
                                      .red); // Penanganan jika gambar tidak ditemukan
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    _currentTime, // Menampilkan tanggal dan waktu saat ini
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),

                  // Kotak Notifikasi dengan status nutrisi, intensitas cahaya, dan ketinggian air
                  _buildNotificationScrollView(),

                  SizedBox(height: 20), // Jarak antara notifikasi dan video

                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.green[200],
                    child: Center(
                        child: Text('Video', style: TextStyle(fontSize: 16))),
                  ),
                  SizedBox(height: 20),

                  // Kontrol Alat
                  Text(
                    'Kontrol Alat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildCardWithIcon('Pompa Nutrisi', _nutrisiStatus,
                      Icons.local_drink, Colors.orange),
                  _buildCardWithIcon(
                      'Pompa Air', 'Aktif', Icons.water, Colors.blue),
                  _buildCardWithIcon(
                      'Lampu UV', 'Aktif', Icons.lightbulb, Colors.purple),
                  _buildCardWithIcon(
                      'Kamera', 'Aktif', Icons.camera_alt, Colors.teal),

                  SizedBox(height: 20),

                  // Pengukuran Sensor
                  Text(
                    'Pengukuran Sensor',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildMeasurementCard('Intensitas Cahaya', _intensitasCahaya,
                      Icons.wb_sunny, Colors.yellow),
                  _buildMeasurementCard('Ketinggian Air', _ketinggianAir,
                      Icons.water_drop, Colors.blue),
                  _buildMeasurementCard('Kadar Nutrisi', _nutrisiStatus,
                      Icons.eco, Colors.lightGreen),

                  SizedBox(height: 20),

                  // Kotak Status
                  _buildStatusCard('Status', 'Buruk/Normal/Panen'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk berpindah ke halaman profil
  void _showProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ProfileScreen(), // Pastikan ProfileScreen diimport
      ),
    );
  }

  // Fungsi untuk membuat kotak notifikasi di bawah tanggal
  Widget _buildNotificationScrollView() {
    return SingleChildScrollView(
      scrollDirection:
          Axis.horizontal, // Mengatur agar bisa digulir secara horizontal
      child: Row(
        children: [
          _buildNotificationBox('Pesan Notifikasi 1', _ketinggianAir,
              _nutrisiStatus, _intensitasCahaya),
          SizedBox(width: 10), // Jarak antara notifikasi
          _buildNotificationBox('Pesan Notifikasi 2', _ketinggianAir,
              _nutrisiStatus, _intensitasCahaya),
        ],
      ),
    );
  }

  // Fungsi untuk membuat kotak notifikasi
  Widget _buildNotificationBox(String message, String ketinggianAir,
      String kadarNutrisi, String intensitasCahaya) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[800], // Warna untuk kotak notifikasi
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Ketinggian Air: $ketinggianAir',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Kadar Nutrisi: $kadarNutrisi',
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Intensitas Cahaya: $intensitasCahaya',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat kartu kontrol alat
  Widget _buildCardWithIcon(
      String title, String status, IconData icon, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon,
                    size: 24, color: iconColor), // Ubah warna icon dinamis
                SizedBox(width: 10),
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Text(status, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat kartu pengukuran sensor
  Widget _buildMeasurementCard(
      String title, String measurement, IconData icon, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon,
                    size: 24, color: iconColor), // Ubah warna icon dinamis
                SizedBox(width: 10),
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Text(measurement, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat kotak status
  Widget _buildStatusCard(String title, String status) {
    return Center(
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green[800], // Warna sesuai tema hidroponik
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              status,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
