import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart'; // Import beranda.dart
import 'navbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulasi delay splash screen selama 3 detik
    Timer(Duration(seconds: 5), () {
      // Setelah 3 detik, navigasi ke halaman berikutnya (Beranda)
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => LoginScreen()), // Ganti NextPage dengan Beranda
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/logo1.png', // path ke gambar
              height: 300, // Atur ukuran sesuai kebutuhan
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0), // Padding di kiri dan kanan
              child: Column(
                children: [
                  SizedBox(
                      height: 20), // Jarak antara teks "AQUAGROW" dan deskripsi
                  Text(
                    'Selamat Datang ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center, // Pusatkan teks
                  ),
                  SizedBox(height: 20), // Jarak yang lebih besar antar teks
                  Text(
                    'Solusi Cerdas untuk Monitoring dan Pengelolaan Pertanian Hidroponik',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20), // Tambahan jarak di bawah deskripsi
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
