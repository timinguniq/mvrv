import 'package:flutter/material.dart';
import 'package:mvrv/theme/theme.dart';
import 'dashboard_card.dart';

/// MVRV Z-Score 구간
enum MvrvZScoreZone {
  capitulation('Capitulation Zone', -1, 0),
  accumulation('Accumulation Zone', 0, 2),
  neutral('Neutral Zone', 2, 5),
  distribution('Distribution Zone', 5, 7),
  euphoria('Euphoria Zone', 7, 10);

  const MvrvZScoreZone(this.label, this.min, this.max);

  final String label;
  final double min;
  final double max;

  static MvrvZScoreZone fromScore(double score) {
    for (final zone in values) {
      if (score >= zone.min && score < zone.max) return zone;
    }
    return score < 0 ? capitulation : euphoria;
  }
}

/// MVRV Z-Score 카드 (좌측 오렌지 스트라이프 + 구간 바)
class MvrvZScoreCard extends StatelessWidget {
  const MvrvZScoreCard({super.key, required this.zScore});

  final double zScore;

  @override
  Widget build(BuildContext context) {
    final zone = MvrvZScoreZone.fromScore(zScore);

    return DashboardCard(
      accentStripe: true,
      padding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'MVRV Z-SCORE',
            style: TextStyle(
              color: DashboardPalette.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            zScore.toStringAsFixed(2),
            style: const TextStyle(
              color: DashboardPalette.textPrimary,
              fontSize: 38,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 16),
          _ZScoreBar(activeZone: zone),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CURRENT STATE',
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
                Icons.auto_graph,
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

class _ZScoreBar extends StatelessWidget {
  const _ZScoreBar({required this.activeZone});

  final MvrvZScoreZone activeZone;

  @override
  Widget build(BuildContext context) {
    const zones = MvrvZScoreZone.values;
    return Row(
      children: [
        for (var i = 0; i < zones.length; i++) ...[
          Expanded(
            flex: (zones[i].max - zones[i].min).round().clamp(1, 10),
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
    // 양 끝은 더 어둡게, 안쪽은 살짝 밝게 해서 단계감 부여
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
