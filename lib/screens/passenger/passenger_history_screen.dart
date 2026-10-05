import 'package:flutter/material.dart';

class PassengerHistoryScreen extends StatelessWidget {
  const PassengerHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Perjalanan'),
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _historyItem(
            destination: 'Pajak USU',
            date: '30 September 2026 • 10:30',
            price: 'Rp8.000',
          ),
          _historyItem(
            destination: 'Medan Mall',
            date: '28 September 2026 • 15:20',
            price: 'Rp12.000',
          ),
          _historyItem(
            destination: 'Ring Road',
            date: '25 September 2026 • 09:15',
            price: 'Rp15.000',
          ),
        ],
      ),
    );
  }

  Widget _historyItem({
    required String destination,
    required String date,
    required String price,
  }) {
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
              Icons.two_wheeler,
              color: Color(0xFF2474F5),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'USU → $destination',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
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