import 'package:flutter/material.dart';

import 'driver_trip_screen.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            _buildPassengerCard(),

            const SizedBox(height: 18),

            const Text(
              'Detail Perjalanan',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF172B4D),
              ),
            ),

            const SizedBox(height: 10),

            _buildRouteCard(),

            const SizedBox(height: 18),

            _buildPriceCard(),

            const SizedBox(height: 18),

            _buildSafetyCard(),

            const SizedBox(height: 25),

            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // PASSENGER
  // ============================================================

  Widget _buildPassengerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF2FF),
              borderRadius: BorderRadius.circular(17),
            ),
            child: const Icon(
              Icons.person,
              color: Color(0xFF2474F5),
              size: 32,
            ),
          ),

          const SizedBox(width: 13),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Jefri Al Bukhori',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Mahasiswa terverifikasi',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Icon(
                      Icons.verified,
                      color: Color(0xFF25B88A),
                      size: 15,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Mahasiswa MOJEK',
                      style: TextStyle(
                        color: Color(0xFF25B88A),
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.phone_outlined,
                color: Color(0xFF2474F5),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ROUTE
  // ============================================================

  Widget _buildRouteCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          _routeItem(
            icon: Icons.my_location,
            color: const Color(0xFF25B88A),
            title: 'Lokasi Jemput',
            value: 'Universitas Sumatera Utara',
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 11,
              top: 5,
              bottom: 5,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 22,
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
          ),

          _routeItem(
            icon: Icons.location_on,
            color: const Color(0xFF2474F5),
            title: 'Tujuan',
            value: 'Pajak USU',
          ),
        ],
      ),
    );
  }

  Widget _routeItem({
    required IconData icon,
    required Color color,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 23,
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PRICE
  // ============================================================

  Widget _buildPriceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.payments_outlined,
            color: Color(0xFF2474F5),
            size: 28,
          ),

          SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Pendapatan perjalanan',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Rp8.000',
                  style: TextStyle(
                    color: Color(0xFF2474F5),
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Text(
            'Tunai',
            style: TextStyle(
              color: Color(0xFF2474F5),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SAFETY
  // ============================================================

  Widget _buildSafetyCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.shield_outlined,
            color: Color(0xFF25B88A),
            size: 27,
          ),

          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Keamanan',
                  style: TextStyle(
                    color: Color(0xFF176B52),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Penumpang telah terverifikasi sebagai '
                  'mahasiswa dan menggunakan akun MOJEK.',
                  style: TextStyle(
                    color: Color(0xFF4C7669),
                    fontSize: 10,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BUTTONS
  // ============================================================

  Widget _buildActionButtons(
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const DriverTripScreen(),
                ),
              );
            },
            child: const Text(
              'Terima Pesanan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  const Color(0xFFE05252),
              side: const BorderSide(
                color: Color(0xFFE05252),
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15),
              ),
            ),
            child: const Text(
              'Tolak Pesanan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}