import 'package:flutter/material.dart';

import '../models/driver.dart';

class DriverCard extends StatelessWidget {
  final Driver driver;
  final VoidCallback? onTap;

  const DriverCard({
    super.key,
    required this.driver,
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
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDriverHeader(),
            const SizedBox(height: 15),
            _buildVehicleInfo(),
            const SizedBox(height: 15),
            _buildBottomInfo(),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // DRIVER HEADER
  // ============================================================

  Widget _buildDriverHeader() {
    return Row(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF2FF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.person,
            color: Color(0xFF2474F5),
            size: 30,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                driver.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF172B4D),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFFFB300),
                    size: 15,
                  ),

                  const SizedBox(width: 4),

                  Text(
                    driver.rating.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Color(0xFF172B4D),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 5),

                  Text(
                    '(${driver.totalTrips} perjalanan)',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        _buildOnlineStatus(),
      ],
    );
  }

  // ============================================================
  // ONLINE STATUS
  // ============================================================

  Widget _buildOnlineStatus() {
    final bool online = driver.isOnline;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: online
            ? const Color(0xFFE8F8F2)
            : const Color(0xFFF1F2F4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(
              color: online
                  ? const Color(0xFF25B88A)
                  : Colors.grey,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 5),

          Text(
            online ? 'ONLINE' : 'OFFLINE',
            style: TextStyle(
              color: online
                  ? const Color(0xFF25B88A)
                  : Colors.grey,
              fontSize: 8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // VEHICLE INFO
  // ============================================================

  Widget _buildVehicleInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FC),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Icon(
              Icons.two_wheeler,
              color: Color(0xFF2474F5),
              size: 22,
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  driver.vehicle,
                  style: const TextStyle(
                    color: Color(0xFF172B4D),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  driver.plateNumber,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF2FF),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Text(
              '${driver.distance.toStringAsFixed(1)} km',
              style: const TextStyle(
                color: Color(0xFF2474F5),
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // BOTTOM INFO
  // ============================================================

  Widget _buildBottomInfo() {
    return Row(
      children: [
        const Icon(
          Icons.school_outlined,
          color: Color(0xFF25B88A),
          size: 17,
        ),

        const SizedBox(width: 5),

        Expanded(
          child: Text(
            driver.faculty,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 9,
            ),
          ),
        ),

        if (onTap != null) ...[
          const SizedBox(width: 8),

          const Text(
            'Lihat detail',
            style: TextStyle(
              color: Color(0xFF2474F5),
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(width: 2),

          const Icon(
            Icons.chevron_right,
            color: Color(0xFF2474F5),
            size: 18,
          ),
        ],
      ],
    );
  }
}