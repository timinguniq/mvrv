import 'package:flutter/material.dart';

import 'dashboard_palette.dart';

/// 대시보드 공통 카드 (좌측 액센트 스트라이프 옵션 지원)
class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.accentStripe = false,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool accentStripe;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: DashboardPalette.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );

    if (!accentStripe) return card;

    return Stack(
      children: [
        card,
        Positioned(
          left: 0,
          top: 12,
          bottom: 12,
          child: Container(
            width: 3,
            decoration: BoxDecoration(
              color: DashboardPalette.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
