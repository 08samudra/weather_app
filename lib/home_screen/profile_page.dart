import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Edit $field",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "New $field",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                newValue = value;
              },
            ),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: const Text('Save'),
                onPressed: () => Navigator.of(context).pop(newValue),
              ),
            ],
          ),
    );
    if (newValue.trim().isNotEmpty) {
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required VoidCallback onPressed,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(value, style: const TextStyle(fontSize: 16)),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onPressed,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF778da9),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream:
            FirebaseFirestore.instance
                .collection("Users")
                .doc(currentUser.email)
                .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Profil
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ), // Ganti dengan gambar profil jika ada
                  ),
                  const SizedBox(height: 16),
                  Text(
                    userData['username'] ?? 'No Username',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(221, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentUser.email!,
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                  const SizedBox(height: 24),

                  // Informasi Dasar
                  const Text(
                    'Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(221, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoCard(
                    title: 'Username',
                    value: userData['username'] ?? '-',
                    onPressed: () => editField('username'),
                  ),
                  _buildInfoCard(
                    title: 'Kota',
                    value: userData['city'] ?? '-',
                    onPressed: () => editField('city'),
                  ),

                  // Tambahkan informasi lain sesuai kebutuhan (misalnya, nama lengkap, nomor telepon, dll.)
                  const SizedBox(height: 24),

                  // Bagian Lain (jika ada)
                  // const Text(
                  //   'Lainnya',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  // ),
                  // const SizedBox(height: 8),
                  // Card(
                  //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text('Alamat', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700])),
                  //         const SizedBox(height: 4),
                  //         Text(userData['address'] ?? 'Tidak ada alamat'),
                  //         Align(
                  //           alignment: Alignment.centerRight,
                  //           child: IconButton(icon: const Icon(Icons.edit), onPressed: () => editField('address')),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Tambahkan card atau expansion tile lain untuk informasi tambahan
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika logout atau aksi lain di sini
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(
                        context,
                        '/login',
                      ); // Contoh navigasi logout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
