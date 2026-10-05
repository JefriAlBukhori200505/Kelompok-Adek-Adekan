import 'package:flutter/material.dart';

import 'login_passenger_screen.dart';
import 'login_driver_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                const SizedBox(height: 35),

                _buildLogo(),

                const SizedBox(height: 28),

                _buildHeroText(),

                const SizedBox(height: 30),

                _buildIllustration(),

                const SizedBox(height: 30),

                _buildBenefits(),

                const SizedBox(height: 30),

                _buildRoleTitle(),

                const SizedBox(height: 15),

                _buildPassengerButton(context),

                const SizedBox(height: 12),

                _buildDriverButton(context),

                const SizedBox(height: 25),

                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // LOGO
  // ============================================================

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xFF2474F5),
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2474F5)
                    .withOpacity(0.25),
                blurRadius: 15,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: const Icon(
            Icons.two_wheeler,
            color: Colors.white,
            size: 30,
          ),
        ),

        const SizedBox(width: 12),

        const Text(
          'MOJEK',
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 28,
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // HERO TEXT
  // ============================================================

  Widget _buildHeroText() {
    return Column(
      children: [
        const Text(
          'Ojek Khusus Mahasiswa',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 27,
            fontWeight: FontWeight.bold,
            height: 1.15,
          ),
        ),

        const SizedBox(height: 12),

        Text(
          'Transportasi lebih mudah, murah, dan nyaman '
          'untuk mahasiswa.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // ILLUSTRATION
  // ============================================================

  Widget _buildIllustration() {
    return Container(
      width: double.infinity,
      height: 190,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFEAF2FF),
            Color(0xFFF4F8FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20,
            left: 25,
            child: _circleDecoration(
              45,
              const Color(0xFF2474F5),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 25,
            child: _circleDecoration(
              30,
              const Color(0xFF25B88A),
            ),
          ),

          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const Icon(
              Icons.two_wheeler,
              color: Color(0xFF2474F5),
              size: 62,
            ),
          ),

          Positioned(
            bottom: 25,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.school_outlined,
                    color: Color(0xFF25B88A),
                    size: 16,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Khusus Mahasiswa',
                    style: TextStyle(
                      color: Color(0xFF172B4D),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleDecoration(
    double size,
    Color color,
  ) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.10),
        shape: BoxShape.circle,
      ),
    );
  }

  // ============================================================
  // BENEFITS
  // ============================================================

  Widget _buildBenefits() {
    return Row(
      children: [
        Expanded(
          child: _benefitItem(
            Icons.payments_outlined,
            'Harga Hemat',
            const Color(0xFF2474F5),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _benefitItem(
            Icons.school_outlined,
            'Sesama Mahasiswa',
            const Color(0xFF25B88A),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: _benefitItem(
            Icons.verified_user_outlined,
            'Terverifikasi',
            const Color(0xFFFFA726),
          ),
        ),
      ],
    );
  }

  Widget _benefitItem(
    IconData icon,
    String title,
    Color color,
  ) {
    return Container(
      height: 105,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFE8ECF1),
        ),
      ),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF172B4D),
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ROLE TITLE
  // ============================================================

  Widget _buildRoleTitle() {
    return const Column(
      children: [
        Text(
          'Mulai Menggunakan MOJEK',
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: 5),

        Text(
          'Pilih peran kamu untuk melanjutkan',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PASSENGER BUTTON
  // ============================================================

  Widget _buildPassengerButton(
    BuildContext context,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const LoginPassengerScreen(),
            ),
          );
        },
        icon: const Icon(
          Icons.person_outline,
          size: 22,
        ),
        label: const Text(
          'Masuk sebagai Penumpang',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DRIVER BUTTON
  // ============================================================

  Widget _buildDriverButton(
    BuildContext context,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const LoginDriverScreen(),
            ),
          );
        },
        icon: const Icon(
          Icons.two_wheeler,
          size: 22,
        ),
        label: const Text(
          'Masuk sebagai Driver',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF2474F5),
          side: const BorderSide(
            color: Color(0xFF2474F5),
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        'MOJEK • Ojek Khusus Mahasiswa',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 9,
        ),
      ),
    );
  }
}