import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_flutter_app/entity/entity.dart';
import 'package:base_flutter_app/presentation/presentation.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:go_router/go_router.dart';

import 'widget/mvrv_insight_card.dart';

/// MVRV 대시보드 페이지
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appBar: AppBar(
        title: Text('BTC MVRV Tracker', style: context.typo.heading1W600),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => context.push(RoutePath.alertSetting.path),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 현재 MVRV 요약
            const SizedBox(height: 24),

            /// 기간 필터
            const SizedBox(height: 16),

            /// MVRV 차트
            const SizedBox(height: 24),

            /// 일일 인사이트
          ],
        ),
      ),
    );
  }
}

class _CurrentMvrvHeader extends StatelessWidget {
  const _CurrentMvrvHeader({required this.data});

  final MvrvData data;

  @override
  Widget build(BuildContext context) {
    final zone = MvrvZone.fromRatio(data.mvrvRatio);
    final zoneColor = switch (zone) {
      MvrvZone.overvalued => Palette.statusDestructive,
      MvrvZone.undervalued => Palette.statusPositive,
      MvrvZone.neutral => context.color.label.normal,
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'MVRV Ratio',
          style: context.typo.label1W500.copyWith(
            color: context.color.label.alternative,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              data.mvrvRatio.toStringAsFixed(2),
              style: context.typo.hero1W700.copyWith(color: zoneColor),
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'BTC \$${_formatPrice(data.btcPrice)}',
                style: context.typo.body1W500.copyWith(
                  color: context.color.label.neutral,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _formatPrice(double price) {
    if (price >= 1000) {
      final formatted = price.toStringAsFixed(0);
      final buffer = StringBuffer();
      for (var i = 0; i < formatted.length; i++) {
        if (i > 0 && (formatted.length - i) % 3 == 0) buffer.write(',');
        buffer.write(formatted[i]);
      }
      return buffer.toString();
    }
    return price.toStringAsFixed(2);
  }
}
