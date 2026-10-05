import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../widgets/bottom_nav.dart';
import 'driver_trip_screen.dart';
import 'order_detail_screen.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() =>
      _DriverHomeScreenState();
}

class _DriverHomeScreenState
    extends State<DriverHomeScreen> {
  int selectedIndex = 0;
  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == 1) {
      return const DriverTripScreen();
    }

    if (selectedIndex == 2) {
      return _buildDriverProfile();
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: _buildHome(),
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
  // HOME
  // ============================================================

  Widget _buildHome() {
    final driver = DummyData.drivers.first;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(
        20,
        20,
        20,
        30,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _buildHeader(driver.name),

          const SizedBox(height: 22),

          _buildOnlineCard(),

          const SizedBox(height: 22),

          _buildIncomeCard(),

          const SizedBox(height: 25),

          _buildSectionTitle(
            'Pesanan Masuk',
            'Permintaan perjalanan mahasiswa',
          ),

          const SizedBox(height: 12),

          _buildOrderCard(),

          const SizedBox(height: 25),

          _buildInfoCard(),
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
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const Text(
                'Halo Driver 👋',
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
  // ONLINE STATUS
  // ============================================================

  Widget _buildOnlineCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isOnline
            ? const Color(0xFFE8F8F2)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isOnline
              ? const Color(0xFFB9E8D7)
              : const Color(0xFFE8ECF1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: isOnline
                  ? const Color(0xFF25B88A)
                  : const Color(0xFFF0F2F5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isOnline
                  ? Icons.two_wheeler
                  : Icons.power_settings_new,
              color: isOnline
                  ? Colors.white
                  : Colors.grey,
              size: 27,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  isOnline
                      ? 'Kamu sedang Online'
                      : 'Kamu sedang Offline',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  isOnline
                      ? 'Kamu bisa menerima pesanan mahasiswa.'
                      : 'Aktifkan status jika ingin menerima pesanan.',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: isOnline,
            activeColor: const Color(0xFF25B88A),
            onChanged: (value) {
              setState(() {
                isOnline = value;
              });

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                SnackBar(
                  content: Text(
                    value
                        ? 'Status driver aktif.'
                        : 'Status driver dinonaktifkan.',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INCOME
  // ============================================================

  Widget _buildIncomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.18),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.account_balance_wallet_outlined,
              color: Colors.white,
              size: 27,
            ),
          ),

          const SizedBox(width: 14),

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Pendapatan Hari Ini',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Rp48.000',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.trending_up,
            color: Colors.white,
          ),
        ],
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
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
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
    );
  }

  // ============================================================
  // ORDER CARD
  // ============================================================

  Widget _buildOrderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF2FF),
                  borderRadius:
                      BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFF2474F5),
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jefri Al Bukhori',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Mahasiswa • 0.8 km dari kamu',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F8F2),
                  borderRadius:
                      BorderRadius.circular(9),
                ),
                child: const Text(
                  'Baru',
                  style: TextStyle(
                    color: Color(0xFF25B88A),
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          _buildRoute(),

          const SizedBox(height: 15),

          Row(
            children: [
              const Expanded(
                child: Text(
                  'Rp8.000',
                  style: TextStyle(
                    color: Color(0xFF2474F5),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 40,
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
                    'Lihat Pesanan',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoute() {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.circle,
                color: Color(0xFF25B88A),
                size: 10,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Universitas Sumatera Utara',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 4,
              top: 4,
              bottom: 4,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 10,
                child: VerticalDivider(
                  width: 10,
                  thickness: 1,
                ),
              ),
            ),
          ),

          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color(0xFF2474F5),
                size: 15,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Pajak USU',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INFO
  // ============================================================

  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF2FF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Color(0xFF2474F5),
            size: 27,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Kamu bebas mengaktifkan atau menonaktifkan '
              'status driver sesuai jadwal kuliahmu.',
              style: TextStyle(
                color: Color(0xFF315B9B),
                fontSize: 10,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // DRIVER PROFILE
  // ============================================================

  Widget _buildDriverProfile() {
    final driver = DummyData.drivers.first;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text('Profil Driver'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor:
                        Color(0xFFEAF2FF),
                    child: Icon(
                      Icons.person,
                      size: 45,
                      color: Color(0xFF2474F5),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    driver.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Mahasiswa • Driver MOJEK',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xFFFFB020),
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '4.9',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            _profileItem(
              Icons.badge_outlined,
              'Status Identitas',
              'Terverifikasi',
            ),

            _profileItem(
              Icons.two_wheeler,
              'Kendaraan',
              driver.vehicle,
            ),

            _profileItem(
              Icons.confirmation_number_outlined,
              'Nomor Kendaraan',
              driver.plateNumber,
            ),

            _profileItem(
              Icons.school_outlined,
              'Status Mahasiswa',
              'Terverifikasi',
            ),
          ],
        ),
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

  Widget _profileItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
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