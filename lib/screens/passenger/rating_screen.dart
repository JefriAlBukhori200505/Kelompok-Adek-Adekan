import 'package:flutter/material.dart';

import '../../models/driver.dart';

class RatingScreen extends StatefulWidget {
  final Driver driver;
  final String destination;

  const RatingScreen({
    super.key,
    required this.driver,
    required this.destination,
  });

  @override
  State<RatingScreen> createState() =>
      _RatingScreenState();
}

class _RatingScreenState
    extends State<RatingScreen> {
  int rating = 5;

  final TextEditingController commentController =
      TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void _submitRating() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Terima kasih! Rating berhasil dikirim.',
        ),
      ),
    );

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (!mounted) return;

        Navigator.popUntil(
          context,
          (route) => route.isFirst,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beri Rating'),
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            _buildSuccessIcon(),

            const SizedBox(height: 18),

            const Text(
              'Perjalanan Selesai!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF172B4D),
              ),
            ),

            const SizedBox(height: 7),

            Text(
              'Bagaimana perjalananmu bersama '
              '${widget.driver.name}?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 25),

            _buildDriverCard(),

            const SizedBox(height: 25),

            _buildRating(),

            const SizedBox(height: 20),

            _buildComment(),

            const SizedBox(height: 25),

            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: 85,
      height: 85,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F2),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.check_circle,
        color: Color(0xFF25B88A),
        size: 60,
      ),
    );
  }

  Widget _buildDriverCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 27,
            backgroundColor: Color(0xFFEAF2FF),
            child: Icon(
              Icons.person,
              color: Color(0xFF2474F5),
              size: 30,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  widget.driver.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.driver.vehicle,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          Text(
            'Rp${widget.driver.price}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2474F5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRating() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          const Text(
            'Berikan penilaian',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) {
                final selected =
                    index < rating;

                return IconButton(
                  onPressed: () {
                    setState(() {
                      rating = index + 1;
                    });
                  },
                  icon: Icon(
                    selected
                        ? Icons.star
                        : Icons.star_border,
                    color: const Color(0xFFFFB020),
                    size: 38,
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 5),

          Text(
            _ratingText(),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  String _ratingText() {
    switch (rating) {
      case 1:
        return 'Sangat tidak puas';
      case 2:
        return 'Tidak puas';
      case 3:
        return 'Cukup';
      case 4:
        return 'Puas';
      case 5:
        return 'Sangat puas';
      default:
        return '';
    }
  }

  Widget _buildComment() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextField(
        controller: commentController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText:
              'Tulis komentar tentang perjalananmu...',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(0xFFF7F9FC),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _submitRating,
        child: Text(
          'Kirim Rating $rating ⭐',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}