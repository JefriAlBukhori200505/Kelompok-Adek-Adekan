import 'package:flutter/material.dart';

import '../../models/driver.dart';
import 'rating_screen.dart';

class TripStatusScreen extends StatefulWidget {
  final Driver driver;
  final String pickup;
  final String destination;

  const TripStatusScreen({
    super.key,
    required this.driver,
    required this.pickup,
    required this.destination,
  });

  @override
  State<TripStatusScreen> createState() =>
      _TripStatusScreenState();
}

class _TripStatusScreenState
    extends State<TripStatusScreen> {
  int currentStatus = 0;

  final List<String> statusTitles = [
    'Mencari driver...',
    'Driver sedang menuju lokasi kamu',
    'Driver sudah sampai',
    'Kamu sedang dalam perjalanan',
    'Perjalanan selesai',
  ];

  final List<IconData> statusIcons = [
    Icons.search,
    Icons.two_wheeler,
    Icons.person_pin_circle,
    Icons.route,
    Icons.check_circle,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Status Perjalanan'),
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildMapPreview(),

            const SizedBox(height: 18),

            _buildStatusCard(),

            const SizedBox(height: 15),

            _buildDriverCard(),

            const SizedBox(height: 15),

            _buildRouteCard(),

            const SizedBox(height: 25),

            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildMapPreview() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE3E8ED),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          CustomPaint(
            painter: _TripMapPainter(),
            child: const SizedBox.expand(),
          ),

          Positioned(
            top: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.circle,
                    color: Color(0xFF25B88A),
                    size: 10,
                  ),
                  SizedBox(width: 7),
                  Text(
                    'Driver aktif',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Center(
            child: Icon(
              Icons.two_wheeler,
              color: Color(0xFF2474F5),
              size: 35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            statusIcons[currentStatus],
            color: currentStatus ==
                    statusTitles.length - 1
                ? const Color(0xFF25B88A)
                : const Color(0xFF2474F5),
            size: 45,
          ),

          const SizedBox(height: 12),

          Text(
            statusTitles[currentStatus],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 7),

          Text(
            currentStatus ==
                    statusTitles.length - 1
                ? 'Terima kasih telah menggunakan MOJEK.'
                : 'Status perjalanan akan diperbarui secara berkala.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
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
              size: 29,
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
                  '${widget.driver.vehicle} • ${widget.driver.plateNumber}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color(0xFFFFB020),
                      size: 14,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      widget.driver.rating.toString(),
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F8F2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              'Aktif',
              style: TextStyle(
                color: Color(0xFF25B88A),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          _routeItem(
            Icons.my_location,
            const Color(0xFF25B88A),
            'Lokasi Jemput',
            widget.pickup,
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 11,
            ),
            child: Container(
              height: 18,
              width: 1,
              color: Colors.grey.shade300,
            ),
          ),

          _routeItem(
            Icons.location_on,
            const Color(0xFF2474F5),
            'Tujuan',
            widget.destination,
          ),
        ],
      ),
    );
  }

  Widget _routeItem(
    IconData icon,
    Color color,
    String title,
    String value,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 22,
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
                  fontSize: 9,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
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

  Widget _buildActionButton() {
    final isFinished =
        currentStatus == statusTitles.length - 1;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          if (!isFinished) {
            setState(() {
              currentStatus++;
            });
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => RatingScreen(
                  driver: widget.driver,
                  destination: widget.destination,
                ),
              ),
            );
          }
        },
        child: Text(
          isFinished
              ? 'Beri Rating'
              : 'Simulasikan Status Berikutnya',
        ),
      ),
    );
  }
}

class _TripMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;

    final roadPaint2 = Paint()
      ..color = const Color(0xFFF2F2F2)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke;

    final path1 = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.3,
        size.width,
        size.height * 0.4,
      );

    final path2 = Path()
      ..moveTo(size.width * 0.2, 0)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.5,
        size.width * 0.8,
        size.height,
      );

    canvas.drawPath(path1, roadPaint);
    canvas.drawPath(path2, roadPaint);

    canvas.drawPath(path1, roadPaint2);
    canvas.drawPath(path2, roadPaint2);
  }

  @override
  bool shouldRepaint(
    covariant CustomPainter oldDelegate,
  ) {
    return false;
  }
}