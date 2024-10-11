import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan tinggi dan lebar layar
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors
            .green[900], // Mengubah warna latar belakang AppBar menjadi hijau
        elevation: 0,
        automaticallyImplyLeading:
            false, // Agar tidak menggunakan default leading
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Profil', // Menambahkan teks "Profil" yang sejajar dengan tombol kembali
              style: TextStyle(
                color: Colors.white, // Warna teks
                fontSize:
                    screenWidth * 0.05, // Sesuaikan ukuran teks dengan layar
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Membuat jarak yang fleksibel untuk mendukung tampilan yang responsif
              SizedBox(height: screenHeight * 0.1),

              // Icon Profil Besar
              CircleAvatar(
                radius: screenWidth * 0.2, // Responsif berdasarkan lebar layar
                backgroundColor: Colors.green[900],
                child: Icon(
                  Icons.person,
                  size: screenWidth * 0.25, // Responsif berdasarkan lebar layar
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              // TextField untuk Nama Pengguna
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 193, 193, 193)),
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
              SizedBox(height: screenHeight * 0.05),

              // Membuat tombol Edit dan Keluar dengan ukuran yang sama
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol Edit
                  SizedBox(
                    width: screenWidth * 0.4, // Lebar tombol diatur agar sama
                    child: ElevatedButton(
                      onPressed: () {
                        // Menampilkan dialog konfirmasi edit
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Konfirmasi Edit"),
                              content: Text(
                                  "Apakah Anda yakin ingin mengedit profil ini?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Menutup dialog
                                  },
                                  child: Text("Batal"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Menutup dialog
                                    // Tambahkan logika untuk edit profil di sini
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Profil berhasil diedit')),
                                    );
                                  },
                                  child: Text("Edit"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Warna tombol biru
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ), // Responsif berdasarkan ukuran layar
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Sudut melengkung
                        ),
                      ),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: screenWidth *
                              0.05, // Responsif berdasarkan lebar layar
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // Tombol Keluar
                  SizedBox(
                    width: screenWidth * 0.4, // Lebar tombol diatur agar sama
                    child: ElevatedButton(
                      onPressed: () {
                        // Menampilkan dialog konfirmasi keluar
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Konfirmasi Keluar"),
                              content: Text("Apakah Anda yakin ingin keluar?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Menutup dialog
                                  },
                                  child: Text("Batal"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // Menutup dialog
                                    // Tambahkan logika keluar aplikasi atau navigasi di sini
                                  },
                                  child: Text("Keluar"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Warna tombol merah
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ), // Responsif berdasarkan ukuran layar
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20), // Sudut melengkung
                        ),
                      ),
                      child: Text(
                        'Keluar',
                        style: TextStyle(
                          fontSize: screenWidth *
                              0.05, // Responsif berdasarkan lebar layar
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Membuat jarak yang fleksibel untuk mendukung tampilan yang responsif
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: ProfileScreen(),
    ));
