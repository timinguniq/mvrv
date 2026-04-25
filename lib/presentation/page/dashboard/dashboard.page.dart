import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mvrv/presentation/presentation.dart';

import 'widget/index.dart';

/// 비트코인 MVRV Z-Score 대시보드 페이지
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  // UI 구성을 위한 임시 mock 데이터 – API 연동 시 Provider 로 교체
  static const _btcPrice = 64281.90;
  static const _change24h = 2.45;
  static const _zScore = 2.41;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: DashboardPalette.background,
      body: SafeArea(
        child: Column(
          children: [
            const DashboardAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    MarketPriceCard(
                      price: _btcPrice,
                      changePercent24h: _change24h,
                    ),
                    SizedBox(height: 16),
                    MvrvZScoreCard(zScore: _zScore),
                    SizedBox(height: 28),
                    MvrvTrendChartCard(),
                    SizedBox(height: 28),
                    MetricCard(
                      title: 'Delta Cap',
                      value: '\$412.8B',
                      description: 'Institutional base support',
                    ),
                    SizedBox(height: 14),
                    MetricCard(
                      title: 'Realized Cap',
                      value: '\$621.2B',
                      description: 'Current market cost basis',
                    ),
                    SizedBox(height: 14),
                    MetricCard(
                      title: 'Net Unrealized P/L',
                      value: '0.582',
                      description: 'Aggregated profit ratio',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
