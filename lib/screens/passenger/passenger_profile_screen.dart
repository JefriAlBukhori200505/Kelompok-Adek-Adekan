import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';

class PassengerProfileScreen extends StatelessWidget {
  const PassengerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = DummyData.passenger;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 45,
              backgroundColor: Color(0xFFEAF2FF),
              child: Icon(
                Icons.person,
                size: 48,
                color: Color(0xFF2474F5),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              user.nim,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            _infoTile(
              Icons.school_outlined,
              'Universitas',
              user.university,
            ),
            _infoTile(
              Icons.badge_outlined,
              'NIM',
              user.nim,
            ),
            _infoTile(
              Icons.verified_user_outlined,
              'Status',
              'Mahasiswa Terverifikasi',
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF2474F5),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}