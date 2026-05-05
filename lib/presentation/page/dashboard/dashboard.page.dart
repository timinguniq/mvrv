import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvrv/core/core.dart';
import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/presentation/presentation.dart';
import 'package:mvrv/theme/theme.dart';

part 'dashboard.view_model.dart';

/// 비트코인 MVRV Z-Score 대시보드 페이지
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: DashboardPalette.background,
      child: BaseView<DashboardViewModel>(
        viewModel: DashboardViewModel(),
        builder: (context, viewModel) {
          if (viewModel.btcPrice == null ||
              viewModel.mvrv == null ||
              viewModel.mvrvHistory == null) {
            return SizedBox();
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardAppBar(),
                  const SizedBox(height: 10),
                  MarketPriceCard(
                    price: viewModel.btcPrice!.price,
                    changePercent24h: viewModel.btcPrice!.changePercent24h,
                  ),
                  const SizedBox(height: 16),
                  MvrvZScoreCard(zScore: viewModel.mvrv!.mvrvZscore),
                  const SizedBox(height: 28),
                  MvrvTrendChartCard(
                    range: viewModel.chartRange,
                    history: viewModel.mvrvHistory!,
                    onRangeChanged: viewModel.changeChartRange,
                  ),
                  const SizedBox(height: 28),
                  MetricCard(
                    title: 'Delta Cap',
                    value: _formatUsdCompact(viewModel.deltaCap!),
                    description: 'Institutional base support',
                  ),
                  const SizedBox(height: 14),
                  const MetricCard(
                    title: 'Net Unrealized P/L',
                    value: '0.582',
                    description: 'Aggregated profit ratio',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

/// 큰 USD 값을 `$xxx.xB` / `$xx.xT` 형태의 컴팩트 문자열로 변환
String _formatUsdCompact(double value) {
  final abs = value.abs();
  final sign = value < 0 ? '-' : '';
  if (abs >= 1e12) return '$sign\$${(abs / 1e12).toStringAsFixed(2)}T';
  if (abs >= 1e9) return '$sign\$${(abs / 1e9).toStringAsFixed(1)}B';
  if (abs >= 1e6) return '$sign\$${(abs / 1e6).toStringAsFixed(1)}M';
  if (abs >= 1e3) return '$sign\$${(abs / 1e3).toStringAsFixed(1)}K';
  return '$sign\$${abs.toStringAsFixed(0)}';
}

class _MarketPricePlaceholder extends StatelessWidget {
  const _MarketPricePlaceholder();

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      child: const SizedBox(
        height: 110,
        child: Center(
          child: CircularProgressIndicator(
            color: DashboardPalette.accent,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
