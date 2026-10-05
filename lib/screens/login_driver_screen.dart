import 'package:flutter/material.dart';

import 'driver/driver_home_screen.dart';

class LoginDriverScreen extends StatefulWidget {
  const LoginDriverScreen({super.key});

  @override
  State<LoginDriverScreen> createState() =>
      _LoginDriverScreenState();
}

class _LoginDriverScreenState
    extends State<LoginDriverScreen> {
  final nimController = TextEditingController();
  final ktpController = TextEditingController();

  bool isLoading = false;
  bool obscureKtp = true;

  @override
  void dispose() {
    nimController.dispose();
    ktpController.dispose();
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

              _buildForm(),

              const SizedBox(height: 20),

              _buildVerificationInfo(),

              const SizedBox(height: 30),

              _buildLoginButton(),

              const SizedBox(height: 15),

              _buildDriverNote(),
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
            Icons.two_wheeler,
            color: Color(0xFF2474F5),
            size: 34,
          ),
        ),

        const SizedBox(height: 22),

        const Text(
          'Login Driver',
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Masuk sebagai driver MOJEK menggunakan '
          'identitas mahasiswa dan KTP.',
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

  Widget _buildForm() {
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

        const SizedBox(height: 18),

        const Text(
          'Nomor KTP',
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: ktpController,
          keyboardType: TextInputType.number,
          obscureText: obscureKtp,
          maxLength: 16,
          decoration: InputDecoration(
            hintText: 'Masukkan nomor KTP',
            counterText: '',
            prefixIcon: const Icon(
              Icons.credit_card_outlined,
              color: Color(0xFF2474F5),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureKtp = !obscureKtp;
                });
              },
              icon: Icon(
                obscureKtp
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
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
  // VERIFICATION INFO
  // ============================================================

  Widget _buildVerificationInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7E5),
        borderRadius: BorderRadius.circular(17),
      ),
      child: const Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.security_outlined,
            color: Color(0xFFD89400),
            size: 25,
          ),

          SizedBox(width: 11),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Verifikasi Driver',
                  style: TextStyle(
                    color: Color(0xFF8A6200),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'KTP digunakan sebagai identitas tambahan '
                  'untuk memastikan keamanan pengguna MOJEK.',
                  style: TextStyle(
                    color: Color(0xFF806C43),
                    fontSize: 10,
                    height: 1.5,
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
                'Masuk sebagai Driver',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  // ============================================================
  // NOTE
  // ============================================================

  Widget _buildDriverNote() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.info_outline,
          color: Colors.grey,
          size: 15,
        ),

        const SizedBox(width: 5),

        Text(
          'Driver dapat online atau offline kapan saja.',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 9,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // LOGIN
  // ============================================================

  void _login() {
    final nim = nimController.text.trim();
    final ktp = ktpController.text.trim();

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

    if (ktp.isEmpty) {
      _showMessage(
        'Silakan masukkan nomor KTP.',
      );
      return;
    }

    if (ktp.length != 16) {
      _showMessage(
        'Nomor KTP harus terdiri dari 16 digit.',
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
                const DriverHomeScreen(),
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