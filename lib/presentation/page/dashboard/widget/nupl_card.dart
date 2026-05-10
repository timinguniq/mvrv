import 'package:flutter/material.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/theme/theme.dart';

import 'dashboard_card.dart';

/// Net Unrealized P/L (NUPL) 카드
///
/// MVRV Z-Score 카드와 동일한 레이아웃 패턴(좌측 오렌지 스트라이프 + 구간 바)
/// 으로 현재 NUPL 값과 시장 심리 구간을 시각화한다.
class NuplCard extends StatelessWidget {
  const NuplCard({super.key, required this.nupl});

  final double nupl;

  @override
  Widget build(BuildContext context) {
    final zone = NuplZone.fromValue(nupl);

    return DashboardCard(
      accentStripe: true,
      padding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NET UNREALIZED P/L',
            style: TextStyle(
              color: DashboardPalette.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            nupl.toStringAsFixed(3),
            style: const TextStyle(
              color: DashboardPalette.textPrimary,
              fontSize: 38,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          _NuplBar(activeZone: zone),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'MARKET SENTIMENT',
                      style: TextStyle(
                        color: DashboardPalette.textMuted,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.6,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      zone.label,
                      style: const TextStyle(
                        color: DashboardPalette.accent,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.insights_rounded,
                color: DashboardPalette.accent,
                size: 26,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NuplBar extends StatelessWidget {
  const _NuplBar({required this.activeZone});

  final NuplZone activeZone;

  @override
  Widget build(BuildContext context) {
    const zones = NuplZone.values;
    return Row(
      children: [
        for (var i = 0; i < zones.length; i++) ...[
          Expanded(
            child: Container(
              height: 6,
              decoration: BoxDecoration(
                color: zones[i] == activeZone
                    ? DashboardPalette.accent
                    : _mutedFor(i),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          if (i < zones.length - 1) const SizedBox(width: 4),
        ],
      ],
    );
  }

  Color _mutedFor(int index) {
    const palette = [
      Color(0xFF3E4154),
      Color(0xFF6B5A2C),
      Color(0xFF3B4566),
      Color(0xFF6B5A2C),
      Color(0xFF3E4154),
    ];
    return palette[index % palette.length];
  }
}
