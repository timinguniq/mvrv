import 'package:flutter/material.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/presentation/presentation.dart';
import 'package:mvrv/theme/theme.dart';

/// 일일 MVRV 인사이트 카드
class MvrvInsightCard extends StatelessWidget {
  const MvrvInsightCard({super.key, required this.mvrvRatio});

  final double mvrvRatio;

  @override
  Widget build(BuildContext context) {
    final zone = MvrvZone.fromRatio(mvrvRatio);
    final (icon, bgColor, iconColor) = switch (zone) {
      MvrvZone.overvalued => (
          Icons.warning_rounded,
          Palette.statusDestructive.withValues(alpha: 0.1),
          Palette.statusDestructive,
        ),
      MvrvZone.undervalued => (
          Icons.trending_down_rounded,
          Palette.statusPositive.withValues(alpha: 0.1),
          Palette.statusPositive,
        ),
      MvrvZone.neutral => (
          Icons.balance_rounded,
          Palette.accentBlue.withValues(alpha: 0.1),
          Palette.accentBlue,
        ),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '오늘의 인사이트',
                  style: context.typo.label2W600.copyWith(
                    color: iconColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  zone.insight,
                  style: context.typo.body2W400.copyWith(
                    color: context.color.label.normal,
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
