import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class OrderCard extends StatelessWidget {
  final TripData trip;
  final VoidCallback? onTap;

  const OrderCard({
    super.key,
    required this.trip,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFFE8ECF1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 15),
            _buildRoute(),
            const SizedBox(height: 15),
            _buildTripInfo(),
            const SizedBox(height: 15),
            _buildPrice(),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF2FF),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Icon(
            Icons.person,
            color: Color(0xFF2474F5),
            size: 27,
          ),
        ),

        const SizedBox(width: 11),

        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                trip.passengerName,
                style: const TextStyle(
                  color: Color(0xFF172B4D),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Row(
                children: [
                  Icon(
                    Icons.verified,
                    color: Color(0xFF25B88A),
                    size: 13,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Mahasiswa Terverifikasi',
                    style: TextStyle(
                      color: Color(0xFF25B88A),
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        _buildStatus(),
      ],
    );
  }

  Widget _buildStatus() {
    Color color;
    Color background;

    switch (trip.status.toLowerCase()) {
      case 'selesai':
        color = const Color(0xFF25B88A);
        background = const Color(0xFFE8F8F2);
        break;

      case 'berlangsung':
        color = const Color(0xFF2474F5);
        background = const Color(0xFFEAF2FF);
        break;

      default:
        color = const Color(0xFFD89400);
        background = const Color(0xFFFFF5DD);
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        trip.status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ============================================================
  // ROUTE
  // ============================================================

  Widget _buildRoute() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _locationRow(
            icon: Icons.my_location,
            color: const Color(0xFF25B88A),
            title: 'Jemput',
            location: trip.pickupLocation,
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 9,
              top: 4,
              bottom: 4,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 1,
                height: 15,
                color: Colors.grey.shade300,
              ),
            ),
          ),

          _locationRow(
            icon: Icons.location_on,
            color: const Color(0xFF2474F5),
            title: 'Tujuan',
            location: trip.destination,
          ),
        ],
      ),
    );
  }

  Widget _locationRow({
    required IconData icon,
    required Color color,
    required String title,
    required String location,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 19,
        ),

        const SizedBox(width: 10),

        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 8,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              location,
              style: const TextStyle(
                color: Color(0xFF172B4D),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================================================
  // TRIP INFO
  // ============================================================

  Widget _buildTripInfo() {
    return Row(
      children: [
        Expanded(
          child: _infoItem(
            Icons.route_outlined,
            'Jarak',
            trip.distance,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _infoItem(
            Icons.access_time,
            'Waktu',
            trip.estimatedTime,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: _infoItem(
            Icons.payments_outlined,
            'Pembayaran',
            trip.paymentMethod,
          ),
        ),
      ],
    );
  }

  Widget _infoItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFF2474F5),
            size: 17,
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 7,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            value,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF172B4D),
              fontSize: 8,
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

  Widget _buildPrice() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Total perjalanan',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
        ),

        Text(
          'Rp${_formatPrice(trip.price)}',
          style: const TextStyle(
            color: Color(0xFF2474F5),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // PRICE FORMAT
  // ============================================================

  String _formatPrice(int price) {
    final String value = price.toString();

    if (value.length <= 3) {
      return value;
    }

    final StringBuffer result =
        StringBuffer();

    int counter = 0;

    for (int i = value.length - 1; i >= 0; i--) {
      result.write(value[i]);
      counter++;

      if (counter == 3 && i != 0) {
        result.write('.');
        counter = 0;
      }
    }

    return result
        .toString()
        .split('')
        .reversed
        .join();
  }
}