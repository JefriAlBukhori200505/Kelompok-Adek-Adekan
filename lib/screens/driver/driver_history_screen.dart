import 'package:flutter/material.dart';

class DriverHistoryScreen extends StatelessWidget {
  const DriverHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Order'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _item(
            'Jefri Al Bukhori',
            'USU → Pajak USU',
            'Rp8.000',
          ),
          _item(
            'Muhammad Fajar',
            'USU → Medan Mall',
            'Rp12.000',
          ),
          _item(
            'Andika',
            'USU → Ring Road',
            'Rp15.000',
          ),
        ],
      ),
    );
  }

  Widget _item(
    String name,
    String route,
    String price,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFEAF2FF),
            child: Icon(
              Icons.person,
              color: Color(0xFF2474F5),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  route,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}