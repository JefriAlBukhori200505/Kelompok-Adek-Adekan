import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../models/driver.dart';
import '../../widgets/driver_card.dart';
import 'booking_screen.dart';

class NearbyDriverScreen extends StatelessWidget {
  final String destination;
  final String pickup;

  const NearbyDriverScreen({
    super.key,
    required this.destination,
    required this.pickup,
  });

  @override
  Widget build(BuildContext context) {
    final onlineDrivers = DummyData.drivers
        .where((driver) => driver.isOnline)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Terdekat'),
      ),
      backgroundColor: const Color(0xFFF7F9FC),
      body: Column(
        children: [
          _buildTripSummary(),

          Expanded(
            child: onlineDrivers.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      10,
                      20,
                      20,
                    ),
                    itemCount: onlineDrivers.length,
                    itemBuilder: (context, index) {
                      final driver = onlineDrivers[index];

                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: DriverCard(
                          driver: driver,
                          onTap: () {
                            _openBooking(
                              context,
                              driver,
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTripSummary() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        20,
        15,
        20,
        5,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Column(
            children: [
              const Icon(
                Icons.my_location,
                color: Color(0xFF25B88A),
                size: 20,
              ),
              Container(
                height: 20,
                width: 1,
                color: Colors.grey.shade300,
              ),
              const Icon(
                Icons.location_on,
                color: Color(0xFF2474F5),
                size: 20,
              ),
            ],
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  pickup,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  destination,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.edit_location_alt_outlined,
            color: Color(0xFF2474F5),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              Icons.two_wheeler_outlined,
              size: 70,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              'Belum ada driver aktif',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Coba cari kembali beberapa saat lagi.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openBooking(
    BuildContext context,
    Driver driver,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BookingScreen(
          driver: driver,
          pickup: pickup,
          destination: destination,
        ),
      ),
    );
  }
}