import 'package:flutter/material.dart';

import 'dashboard_card.dart';
import 'dashboard_palette.dart';

/// 비트코인 현재가 카드
class MarketPriceCard extends StatelessWidget {
  const MarketPriceCard({
    super.key,
    required this.price,
    required this.changePercent24h,
  });

  final double price;
  final double changePercent24h;

  @override
  Widget build(BuildContext context) {
    final isUp = changePercent24h >= 0;
    final sign = isUp ? '+' : '';
    final changeColor = isUp
        ? DashboardPalette.accent
        : DashboardPalette.textSecondary;

    return DashboardCard(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'MARKET PRICE',
                style: TextStyle(
                  color: DashboardPalette.textMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: DashboardPalette.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'LIVE',
                  style: TextStyle(
                    color: DashboardPalette.accent,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            '\$${_formatUsd(price)}',
            style: const TextStyle(
              color: DashboardPalette.textPrimary,
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                isUp ? Icons.trending_up : Icons.trending_down,
                color: changeColor,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                '$sign${changePercent24h.toStringAsFixed(2)}% (24H)',
                style: TextStyle(
                  color: changeColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatUsd(double value) {
    final whole = value.toStringAsFixed(2);
    final parts = whole.split('.');
    final intPart = parts[0];
    final buf = StringBuffer();
    for (var i = 0; i < intPart.length; i++) {
      if (i > 0 && (intPart.length - i) % 3 == 0) buf.write(',');
      buf.write(intPart[i]);
    }
    return '$buf.${parts[1]}';
  }
}
