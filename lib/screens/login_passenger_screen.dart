import 'package:flutter/material.dart';

import 'passenger/passenger_home_screen.dart';

class LoginPassengerScreen extends StatefulWidget {
  const LoginPassengerScreen({super.key});

  @override
  State<LoginPassengerScreen> createState() =>
      _LoginPassengerScreenState();
}

class _LoginPassengerScreenState
    extends State<LoginPassengerScreen> {
  final nimController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    nimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF172B4D),
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            24,
            10,
            24,
            30,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              _buildHeader(),

              const SizedBox(height: 30),

              _buildLoginForm(),

              const SizedBox(height: 20),

              _buildInfo(),

              const SizedBox(height: 30),

              _buildLoginButton(),
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
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF2FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.person_outline,
            color: Color(0xFF2474F5),
            size: 34,
          ),
        ),

        const SizedBox(height: 22),

        const Text(
          'Login Penumpang',
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Masuk menggunakan NIM mahasiswa '
          'untuk menggunakan layanan MOJEK.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // FORM
  // ============================================================

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'NIM Mahasiswa',
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: nimController,
          keyboardType: TextInputType.number,
          maxLength: 15,
          decoration: InputDecoration(
            hintText: 'Masukkan NIM kamu',
            counterText: '',
            prefixIcon: const Icon(
              Icons.badge_outlined,
              color: Color(0xFF2474F5),
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xFFE8ECF1),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xFF2474F5),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // INFO
  // ============================================================

  Widget _buildInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F2),
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.verified_user_outlined,
            color: Color(0xFF25B88A),
            size: 24,
          ),

          SizedBox(width: 11),

          Expanded(
            child: Text(
              'MOJEK hanya dapat digunakan oleh mahasiswa. '
              'NIM digunakan untuk memastikan pengguna '
              'merupakan mahasiswa.',
              style: TextStyle(
                color: Color(0xFF4C7669),
                fontSize: 10,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // LOGIN BUTTON
  // ============================================================

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : _login,
        child: isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Text(
                'Masuk ke MOJEK',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  // ============================================================
  // LOGIN
  // ============================================================

  void _login() {
    final nim = nimController.text.trim();

    if (nim.isEmpty) {
      _showMessage(
        'Silakan masukkan NIM terlebih dahulu.',
      );
      return;
    }

    if (nim.length < 5) {
      _showMessage(
        'NIM yang dimasukkan terlalu pendek.',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    Future.delayed(
      const Duration(milliseconds: 700),
      () {
        if (!mounted) return;

        setState(() {
          isLoading = false;
        });

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const PassengerHomeScreen(),
          ),
        );
      },
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
  }
}