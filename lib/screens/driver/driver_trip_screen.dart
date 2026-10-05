import 'package:flutter/material.dart';

class DriverTripScreen extends StatefulWidget {
  const DriverTripScreen({super.key});

  @override
  State<DriverTripScreen> createState() =>
      _DriverTripScreenState();
}

class _DriverTripScreenState
    extends State<DriverTripScreen> {
  int currentStatus = 0;

  final List<String> statusList = [
    'Menuju lokasi penjemputan',
    'Driver sudah sampai',
    'Penumpang sudah naik',
    'Menuju lokasi tujuan',
    'Perjalanan selesai',
  ];

  final List<IconData> statusIcons = [
    Icons.navigation_outlined,
    Icons.location_on,
    Icons.person_add_alt_1,
    Icons.route,
    Icons.check_circle,
  ];

  @override
  Widget build(BuildContext context) {
    final isFinished =
        currentStatus == statusList.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perjalanan Aktif'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildMap(),

            const SizedBox(height: 18),

            _buildStatusCard(),

            const SizedBox(height: 15),

            _buildPassengerCard(),

            const SizedBox(height: 15),

            _buildRouteCard(),

            const SizedBox(height: 25),

            _buildMainButton(isFinished),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MAP
  // ============================================================

  Widget _buildMap() {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE3E8ED),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          CustomPaint(
            painter: _DriverMapPainter(),
            child: const SizedBox.expand(),
          ),

          Positioned(
            top: 18,
            left: 18,
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
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF25B88A),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 7),
                  const Text(
                    'Perjalanan aktif',
                    style: TextStyle(
                      fontSize: 10,
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
              size: 38,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // STATUS
  // ============================================================

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
                    statusList.length - 1
                ? const Color(0xFF25B88A)
                : const Color(0xFF2474F5),
            size: 42,
          ),

          const SizedBox(height: 10),

          Text(
            statusList[currentStatus],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            currentStatus ==
                    statusList.length - 1
                ? 'Perjalanan telah selesai.'
                : 'Perbarui status perjalanan setelah '
                    'menyelesaikan tahap berikutnya.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PASSENGER
  // ============================================================

  Widget _buildPassengerCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
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

          const Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Jefri Al Bukhori',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Mahasiswa MOJEK',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF2FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Fitur panggilan masih dalam tahap frontend.',
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.phone_outlined,
                color: Color(0xFF2474F5),
                size: 19,
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
      padding: const EdgeInsets.all(17),
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
            'Universitas Sumatera Utara',
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
                height: 20,
                width: 1,
                color: Colors.grey.shade300,
              ),
            ),
          ),

          _routeItem(
            Icons.location_on,
            const Color(0xFF2474F5),
            'Tujuan',
            'Pajak USU',
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
    );
  }

  // ============================================================
  // MAIN BUTTON
  // ============================================================

  Widget _buildMainButton(bool isFinished) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: ElevatedButton(
        onPressed: () {
          if (!isFinished) {
            setState(() {
              currentStatus++;
            });
          } else {
            _finishTrip();
          }
        },
        child: Text(
          isFinished
              ? 'Selesaikan Perjalanan'
              : _buttonText(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  String _buttonText() {
    switch (currentStatus) {
      case 0:
        return 'Saya Sudah Sampai di Lokasi';
      case 1:
        return 'Penumpang Sudah Naik';
      case 2:
        return 'Mulai Perjalanan';
      case 3:
        return 'Sampai di Tujuan';
      default:
        return 'Lanjutkan';
    }
  }

  void _finishTrip() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Perjalanan Selesai',
          ),
          content: const Text(
            'Pendapatan Rp8.000 telah ditambahkan '
            'ke pendapatan hari ini.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Selesai'),
            ),
          ],
        );
      },
    );
  }
}

class _DriverMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 16
      ..style = PaintingStyle.stroke;

    final roadPaint2 = Paint()
      ..color = const Color(0xFFF2F2F2)
      ..strokeWidth = 7
      ..style = PaintingStyle.stroke;

    final path1 = Path()
      ..moveTo(0, size.height * 0.65)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.2,
        size.width,
        size.height * 0.35,
      );

    final path2 = Path()
      ..moveTo(size.width * 0.2, 0)
      ..quadraticBezierTo(
        size.width * 0.45,
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