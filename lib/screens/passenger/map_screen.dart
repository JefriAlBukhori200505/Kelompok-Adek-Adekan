import 'package:flutter/material.dart';

import 'nearby_driver_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController destinationController =
      TextEditingController();

  String currentLocation = 'Universitas Sumatera Utara';

  @override
  void dispose() {
    destinationController.dispose();
    super.dispose();
  }

  void _searchDriver() {
    final destination = destinationController.text.trim();

    if (destination.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Masukkan lokasi tujuan terlebih dahulu.',
          ),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => NearbyDriverScreen(
          destination: destination,
          pickup: currentLocation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Driver'),
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: Column(
        children: [
          Expanded(
            child: _buildMapArea(),
          ),
          _buildLocationPanel(),
        ],
      ),
    );
  }

  Widget _buildMapArea() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFFE3E8ED),
          child: CustomPaint(
            painter: _MapPainter(),
            child: const SizedBox.expand(),
          ),
        ),

        Positioned(
          top: 20,
          left: 20,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                ),
              ],
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.my_location,
                  color: Color(0xFF25B88A),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Lokasi kamu saat ini',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  Icons.gps_fixed,
                  color: Color(0xFF2474F5),
                ),
              ],
            ),
          ),
        ),

        _driverMarker(
          top: 130,
          left: 70,
        ),

        _driverMarker(
          top: 210,
          right: 80,
        ),

        _driverMarker(
          top: 310,
          left: 150,
        ),

        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF2474F5),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Lokasi berhasil diperbarui.',
                  ),
                ),
              );
            },
            child: const Icon(Icons.my_location),
          ),
        ),
      ],
    );
  }

  Widget _driverMarker({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFF2474F5),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 8,
            ),
          ],
        ),
        child: const Icon(
          Icons.two_wheeler,
          color: Colors.white,
          size: 21,
        ),
      ),
    );
  }

  Widget _buildLocationPanel() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tentukan perjalanan',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF172B4D),
            ),
          ),

          const SizedBox(height: 15),

          _locationInput(
            icon: Icons.my_location,
            iconColor: const Color(0xFF25B88A),
            label: 'Lokasi Jemput',
            value: currentLocation,
            enabled: false,
          ),

          const SizedBox(height: 10),

          TextField(
            controller: destinationController,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.location_on_outlined,
                color: Color(0xFF2474F5),
              ),
              hintText: 'Masukkan lokasi tujuan',
              filled: true,
              fillColor: const Color(0xFFF7F9FC),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: _searchDriver,
              icon: const Icon(Icons.search),
              label: const Text(
                'Cari Driver Terdekat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _locationInput({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required bool enabled,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
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
                    fontSize: 13,
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

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 18
      ..style = PaintingStyle.stroke;

    final smallRoadPaint = Paint()
      ..color = const Color(0xFFF4F4F4)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    final mainRoad = Path()
      ..moveTo(0, size.height * 0.35)
      ..quadraticBezierTo(
        size.width * 0.35,
        size.height * 0.15,
        size.width,
        size.height * 0.4,
      );

    final secondRoad = Path()
      ..moveTo(size.width * 0.15, size.height)
      ..quadraticBezierTo(
        size.width * 0.45,
        size.height * 0.55,
        size.width * 0.8,
        0,
      );

    canvas.drawPath(mainRoad, roadPaint);
    canvas.drawPath(secondRoad, roadPaint);

    final smallRoad1 = Path()
      ..moveTo(0, size.height * 0.75)
      ..lineTo(size.width, size.height * 0.15);

    final smallRoad2 = Path()
      ..moveTo(size.width * 0.1, 0)
      ..lineTo(size.width * 0.9, size.height);

    canvas.drawPath(smallRoad1, smallRoadPaint);
    canvas.drawPath(smallRoad2, smallRoadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}