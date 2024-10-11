import 'package:flutter/material.dart';
import 'navbar.dart'; // Import file navbar.dart

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo di bagian atas
              Image.asset(
                'assets/image/logo1.png', // Path logo AQUAGROW Anda
                height: 210, // Sesuaikan tinggi logo
              ),
              SizedBox(height: 20),

              // Nama Aplikasi (AQUAGROW)
              SizedBox(height: 40),

              // TextField untuk Nama Pengguna
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Masukkan Nama Pengguna',
                  labelStyle: TextStyle(color: const Color.fromARGB(255, 193, 193, 193)),
                  hintText: 'Masukkan Nama Pengguna',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 30),

              // Tombol Masuk
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman Navbar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Warna tombol hijau
                  padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10), // Ubah padding untuk tombol lebih kecil
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Sudut melengkung
                  ),
                ),
                child: Text(
                  'MASUK',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: LoginScreen(),
    ));
