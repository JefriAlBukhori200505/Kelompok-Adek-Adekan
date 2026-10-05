import 'package:flutter/material.dart';

class RoleButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool filled;
  final VoidCallback onTap;

  const RoleButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF2474F5);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: filled ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: primaryColor,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: filled
                    ? Colors.white.withOpacity(0.15)
                    : const Color(0xFFEAF2FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: filled ? Colors.white : primaryColor,
              ),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: filled
                          ? Colors.white
                          : const Color(0xFF172B4D),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: filled ? Colors.white70 : Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: filled ? Colors.white : primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}