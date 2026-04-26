import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvrv/core/core.dart';
import 'package:mvrv/domain/domain.dart';
import 'package:mvrv/presentation/presentation.dart';
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/theme/theme.dart';

part 'dashboard.view_model.dart';

/// 비트코인 MVRV Z-Score 대시보드 페이지
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  // UI 구성을 위한 임시 mock 데이터 – API 연동 시 Provider 로 교체
  static const _zScore = 2.41;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultLayout(
      backgroundColor: DashboardPalette.background,
      child: BaseView<DashboardViewModel>(
        viewModel: DashboardViewModel(),
        builder: (context, viewModel){
          if(viewModel.btcPrice == null){
            return SizedBox();
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DashboardAppBar(),
                  const SizedBox(height: 10),
                  MarketPriceCard(price: viewModel.btcPrice!.price, changePercent24h: viewModel.btcPrice!.changePercent24h),
                  const SizedBox(height: 16),
                  const MvrvZScoreCard(zScore: _zScore),
                  const SizedBox(height: 28),
                  const MvrvTrendChartCard(),
                  const SizedBox(height: 28),
                  const MetricCard(
                    title: 'Delta Cap',
                    value: '\$412.8B',
                    description: 'Institutional base support',
                  ),
                  const SizedBox(height: 14),
                  const MetricCard(
                    title: 'Realized Cap',
                    value: '\$621.2B',
                    description: 'Current market cost basis',
                  ),
                  const SizedBox(height: 14),
                  const MetricCard(
                    title: 'Net Unrealized P/L',
                    value: '0.582',
                    description: 'Aggregated profit ratio',
                  ),
                ],),
            ),
          ) ;
        }
      )
    );
  }
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
