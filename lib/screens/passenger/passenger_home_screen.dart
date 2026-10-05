import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../widgets/bottom_nav.dart';
import 'map_screen.dart';
import 'passenger_history_screen.dart';
import 'passenger_profile_screen.dart';

class PassengerHomeScreen extends StatefulWidget {
  const PassengerHomeScreen({super.key});

  @override
  State<PassengerHomeScreen> createState() =>
      _PassengerHomeScreenState();
}

class _PassengerHomeScreenState
    extends State<PassengerHomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    if (selectedIndex == 1) {
      currentScreen = const PassengerHistoryScreen();
    } else if (selectedIndex == 2) {
      currentScreen = const PassengerProfileScreen();
    } else {
      currentScreen = _buildHomeContent();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: currentScreen,
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  // ============================================================
  // HOME CONTENT
  // ============================================================

  Widget _buildHomeContent() {
    final user = DummyData.passenger;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(user.name),

          const SizedBox(height: 25),

          _buildStudentBadge(),

          const SizedBox(height: 20),

          _buildSearchCard(),

          const SizedBox(height: 25),

          _buildSectionTitle(
            'Kenapa pilih MOJEK?',
            'Ojek khusus mahasiswa',
          ),

          const SizedBox(height: 14),

          _buildBenefits(),

          const SizedBox(height: 25),

          _buildSectionTitle(
            'Perjalanan Terakhir',
            'Lihat aktivitasmu',
          ),

          const SizedBox(height: 14),

          _buildRecentTrip(),

          const SizedBox(height: 25),

          _buildSafetyCard(),
        ],
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader(String name) {
    final firstName = name.split(' ').first;

    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF2FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.person,
            color: Color(0xFF2474F5),
            size: 28,
          ),
        ),

        const SizedBox(width: 13),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Selamat datang 👋',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                firstName,
                style: const TextStyle(
                  color: Color(0xFF172B4D),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Color(0xFF172B4D),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // STUDENT BADGE
  // ============================================================

  Widget _buildStudentBadge() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2474F5),
            Color(0xFF4A8CF7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.school,
              color: Colors.white,
              size: 25,
            ),
          ),

          const SizedBox(width: 13),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mahasiswa Terverifikasi',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Nikmati perjalanan khusus mahasiswa.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.verified,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SEARCH DRIVER
  // ============================================================

  Widget _buildSearchCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mau pergi ke mana?',
            style: TextStyle(
              color: Color(0xFF172B4D),
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Cari driver mahasiswa terdekat dari lokasimu.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FC),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFFE5EAF0),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFF2474F5),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Masukkan tujuan perjalanan',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          _buildSearchButton(),
        ],
      ),
    );
  }

  Widget _buildSearchButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const MapScreen(),
            ),
          );
        },
        icon: const Icon(
          Icons.search,
          size: 21,
        ),
        label: const Text(
          'Cari Driver Terdekat',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2474F5),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle(
    String title,
    String subtitle,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF172B4D),
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ============================================================
  // BENEFITS
  // ============================================================

  Widget _buildBenefits() {
    return Row(
      children: [
        Expanded(
          child: _buildBenefitItem(
            icon: Icons.savings_outlined,
            title: 'Lebih Hemat',
            subtitle: 'Tarif mahasiswa',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildBenefitItem(
            icon: Icons.school_outlined,
            title: 'Khusus Mahasiswa',
            subtitle: 'Sesama mahasiswa',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildBenefitItem(
            icon: Icons.location_on_outlined,
            title: 'Driver Terdekat',
            subtitle: 'Mudah ditemukan',
          ),
        ),
      ],
    );
  }

  Widget _buildBenefitItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 135,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF2FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2474F5),
              size: 21,
            ),
          ),

          const Spacer(),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RECENT TRIP
  // ============================================================

  Widget _buildRecentTrip() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF2FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.two_wheeler,
              color: Color(0xFF2474F5),
            ),
          ),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'USU → Pajak USU',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '30 September 2026 • 10:30',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rp8.000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2474F5),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Selesai',
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
    );
  }

  // ============================================================
  // SAFETY CARD
  // ============================================================

  Widget _buildSafetyCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF8F3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.shield_outlined,
            color: Color(0xFF25B88A),
            size: 30,
          ),

          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perjalanan Lebih Aman',
                  style: TextStyle(
                    color: Color(0xFF176B52),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Driver MOJEK telah terverifikasi sebagai mahasiswa.',
                  style: TextStyle(
                    color: Color(0xFF4C7669),
                    fontSize: 10,
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