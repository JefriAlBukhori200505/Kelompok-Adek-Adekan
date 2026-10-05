import 'package:flutter/material.dart';

class DriverIncomeScreen extends StatelessWidget {
  const DriverIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pendapatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF2474F5),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                children: [
                  Text(
                    'Total Pendapatan',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp356.000',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Bulan ini',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _item('Hari ini', 'Rp56.000'),
            _item('Kemarin', 'Rp72.000'),
            _item('28 September', 'Rp64.000'),
          ],
        ),
      ),
    );
  }

  Widget _item(String date, String amount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(child: Text(date)),
          Text(
            amount,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF25B88A),
            ),
          ),
        ],
      ),
    );
  }
}