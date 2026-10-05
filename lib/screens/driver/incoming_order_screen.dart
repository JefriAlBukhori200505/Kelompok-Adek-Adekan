import 'package:flutter/material.dart';

import 'order_detail_screen.dart';

class IncomingOrderScreen extends StatelessWidget {
  const IncomingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text('Pesanan Masuk'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(
            20,
            15,
            20,
            30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),

              const SizedBox(height: 20),

              _buildOrderCard(context),

              const SizedBox(height: 18),

              _buildInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ada Pesanan Baru! 🔔',
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Berikut detail permintaan perjalanan dari mahasiswa.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ORDER CARD
  // ============================================================

  Widget _buildOrderCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildPassengerHeader(),

          const SizedBox(height: 18),

          _buildRouteSection(),

          const SizedBox(height: 18),

          _buildDistanceInfo(),

          const SizedBox(height: 18),

          _buildPriceSection(),

          const SizedBox(height: 20),

          _buildButtons(context),
        ],
      ),
    );
  }

  // ============================================================
  // PASSENGER
  // ============================================================

  Widget _buildPassengerHeader() {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF2FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.person,
            color: Color(0xFF2474F5),
            size: 31,
          ),
        ),

        const SizedBox(width: 13),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jefri Al Bukhori',
                style: TextStyle(
                  color: Color(0xFF172B4D),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.verified,
                    color: Color(0xFF25B88A),
                    size: 15,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Mahasiswa Terverifikasi',
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
          padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF5DD),
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Text(
            'BARU',
            style: TextStyle(
              color: Color(0xFFD89400),
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ROUTE
  // ============================================================

  Widget _buildRouteSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          _buildLocationRow(
            icon: Icons.my_location,
            color: const Color(0xFF25B88A),
            title: 'Lokasi Jemput',
            location: 'Universitas Sumatera Utara',
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              top: 5,
              bottom: 5,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 1,
                height: 22,
                color: Colors.grey.shade300,
              ),
            ),
          ),

          _buildLocationRow(
            icon: Icons.location_on,
            color: const Color(0xFF2474F5),
            title: 'Tujuan',
            location: 'Pajak USU',
          ),
        ],
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color color,
    required String title,
    required String location,
  }) {
    return Row(
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 13,
          ),
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
                  fontSize: 9,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                location,
                style: const TextStyle(
                  color: Color(0xFF172B4D),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DISTANCE
  // ============================================================

  Widget _buildDistanceInfo() {
    return Row(
      children: [
        Expanded(
          child: _smallInfo(
            icon: Icons.route_outlined,
            title: 'Jarak',
            value: '1.8 km',
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _smallInfo(
            icon: Icons.access_time,
            title: 'Perkiraan',
            value: '8 menit',
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _smallInfo(
            icon: Icons.person_outline,
            title: 'Penumpang',
            value: '1 orang',
          ),
        ),
      ],
    );
  }

  Widget _smallInfo({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF2474F5),
            size: 19,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 8,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF172B4D),
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PRICE
  // ============================================================

  Widget _buildPriceSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.payments_outlined,
              color: Color(0xFF2474F5),
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pendapatan perjalanan',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Rp8.000',
                  style: TextStyle(
                    color: Color(0xFF2474F5),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Text(
            'Tunai',
            style: TextStyle(
              color: Color(0xFF2474F5),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BUTTONS
  // ============================================================

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const OrderDetailScreen(),
                ),
              );
            },
            child: const Text(
              'Lihat Detail Pesanan',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: () {
              _showRejectDialog(context);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFE05252),
              side: const BorderSide(
                color: Color(0xFFE05252),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              'Tolak Pesanan',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // INFO CARD
  // ============================================================

  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F2),
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: Color(0xFF25B88A),
            size: 25,
          ),

          SizedBox(width: 11),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ingat!',
                  style: TextStyle(
                    color: Color(0xFF176B52),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Pastikan kamu sedang tidak memiliki jadwal '
                  'kuliah sebelum menerima pesanan.',
                  style: TextStyle(
                    color: Color(0xFF4C7669),
                    fontSize: 9,
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
  // REJECT DIALOG
  // ============================================================

  void _showRejectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            'Tolak Pesanan?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Apakah kamu yakin ingin menolak '
            'permintaan perjalanan ini?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Pesanan berhasil ditolak.',
                    ),
                  ),
                );
              },
              child: const Text(
                'Tolak',
                style: TextStyle(
                  color: Color(0xFFE05252),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}