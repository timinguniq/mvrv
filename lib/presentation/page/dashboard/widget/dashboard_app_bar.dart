import 'package:flutter/material.dart';

import 'dashboard_palette.dart';

/// 대시보드 상단 바 – 로고 + 알림 + 프로필 아이콘
class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Row(
        children: [
          _buildLogoMark(),
          const SizedBox(width: 10),
          const Text(
            'Sovereign Vault',
            style: TextStyle(
              color: DashboardPalette.accent,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildLogoMark() {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: DashboardPalette.cardAlt,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: DashboardPalette.accent.withValues(alpha: 0.7),
          width: 1.2,
        ),
      ),
      alignment: Alignment.center,
      child: const Text(
        'C',
        style: TextStyle(
          color: DashboardPalette.accent,
          fontSize: 14,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}