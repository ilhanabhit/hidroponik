import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen height and width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Profil',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.05,
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
              SizedBox(height: screenHeight * 0.1),

              // Profile Icon
              CircleAvatar(
                radius: screenWidth * 0.2,
                backgroundColor: Colors.green[900],
                child: Icon(
                  Icons.person,
                  size: screenWidth * 0.25,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Name TextField
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Masukkan Nama Pengguna',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Password TextField
              TextFormField(
                obscureText: true, // Hide password input
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  labelStyle: TextStyle(color: Colors.grey),
                  hintText: 'Masukkan Kata Sandi',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.green, width: 1.5),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Action buttons: Edit and Logout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    context,
                    label: 'Edit',
                    color: Colors.blue,
                    onPressed: () => _showConfirmationDialog(
                      context,
                      title: "Konfirmasi Edit",
                      content: "Apakah Anda yakin ingin mengedit profil ini?",
                      confirmLabel: "Edit",
                      onConfirm: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Profil berhasil diedit')),
                        );
                      },
                    ),
                  ),
                  _buildActionButton(
                    context,
                    label: 'Keluar',
                    color: Colors.red,
                    onPressed: () => _showConfirmationDialog(
                      context,
                      title: "Konfirmasi Keluar",
                      content: "Apakah Anda yakin ingin keluar?",
                      confirmLabel: "Keluar",
                      onConfirm: () {
                        // Logic for logout
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build action buttons
  Widget _buildActionButton(BuildContext context,
      {required String label,
      required Color color,
      required VoidCallback onPressed}) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth * 0.4,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(
              vertical: 15), // Increased padding for better touch area
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.05,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Function to show confirmation dialogs
  void _showConfirmationDialog(BuildContext context,
      {required String title,
      required String content,
      required String confirmLabel,
      required VoidCallback onConfirm}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                onConfirm(); // Call the confirmation action
              },
              child: Text(confirmLabel),
            ),
          ],
        );
      },
    );
  }
}

void main() => runApp(MaterialApp(
      home: ProfileScreen(),
    ));
