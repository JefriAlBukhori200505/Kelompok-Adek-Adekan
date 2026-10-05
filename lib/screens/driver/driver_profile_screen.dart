import 'package:flutter/material.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Driver'),
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
                Icons.two_wheeler,
                size: 45,
                color: Color(0xFF2474F5),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Andi Pratama',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'NIM 241401101',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),
            _item(
              Icons.school_outlined,
              'Universitas',
              'Universitas Sumatera Utara',
            ),
            _item(
              Icons.motorcycle_outlined,
              'Kendaraan',
              'Honda Vario',
            ),
            _item(
              Icons.confirmation_number_outlined,
              'Nomor Kendaraan',
              'BK 1234 ABC',
            ),
            _item(
              Icons.star_outline,
              'Rating',
              '4.8 / 5.0',
            ),
            _item(
              Icons.verified_user_outlined,
              'Verifikasi',
              'KTP Terverifikasi',
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(
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
          const SizedBox(width: 12),
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