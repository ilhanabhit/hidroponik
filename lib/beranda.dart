import 'package:flutter/material.dart';
import 'profil.dart';
import 'package:intl/intl.dart'; // For formatting date and time
import 'dart:async'; // Untuk menggunakan Timer

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime(); // Call the function to update the time when the screen loads
    Timer.periodic(Duration(minutes: 1),
        (Timer t) => _updateTime()); // Update every minute
  }

  void _updateTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('EEEE, d MMMM yyyy, HH:mm')
        .format(now); // Format: Day, Date Month Year, Hour:Minute
    setState(() {
      _currentTime = formattedTime;
    });
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
        backgroundColor: Colors.green[
            800], // Mengatur warna latar belakang AppBar sesuai tema hidroponik
        actions: [
          IconButton(
            icon: Icon(Icons.person,
                color: Colors.white), // Mengganti ikon menjadi profil
            onPressed: () {
              _showProfile(context); // Fungsi untuk membuka profil
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
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Hai, Farid!\nSelamat Datang Di',
                          textAlign: TextAlign.left, // Meratakan ke kiri
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[
                                900], // Warna hijau yang kuat sesuai tema hidroponik
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
                    _currentTime, // Display real-time date and time
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.green[200],
                    child: Center(
                        child: Text('Video', style: TextStyle(fontSize: 16))),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      _buildCardWithIcon('Pompa Nutrisi', 'Aktif',
                          Icons.local_drink, Colors.orange),
                      _buildCardWithIcon(
                          'Nutrisi', 'Tersedia', Icons.eco, Colors.lightGreen),
                      _buildCardWithIcon('Ketinggian Air', 'Normal',
                          Icons.water_drop, Colors.blue),
                      _buildCardWithIcon('Pompa Air', 'Aktif',
                          Icons.local_drink, Colors.orange),
                      _buildCardWithIcon('Intensitas Cahaya', '00 cd',
                          Icons.wb_sunny, Colors.yellow),
                      _buildCardWithIcon(
                          'Lampu UV', 'Aktif', Icons.lightbulb, Colors.purple),
                      _buildCardWithIcon(
                          'Kamera', 'Aktif', Icons.camera_alt, Colors.teal),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildStatusCard('Status', 'Buruk/Normal/Bagus/Panen'),
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

  // Menambahkan parameter color agar warna bisa diatur
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
}
