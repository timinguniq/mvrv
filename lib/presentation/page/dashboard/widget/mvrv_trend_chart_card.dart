import 'dart:math' as math;
import 'package:mvrv/entity/entity.dart';
import 'package:mvrv/theme/theme.dart';
import 'package:flutter/material.dart';

import 'dashboard_card.dart';

/// Y축 라벨 영역 폭 / 차트 상하 여백 (차트와 라벨 위치 정렬용)
const double _kYAxisWidth = 40.0;
const double _kChartVerticalPadding = 8.0;

/// 차트 기간 필터 (대시보드 전용)
///
/// [days] 가 null 이면 전체 범위 (필터 없음)
enum MvrvChartRange {
  oneMonth('1M', 30),
  sixMonths('6M', 180),
  oneYear('1Y', 365),
  all('ALL', null);

  const MvrvChartRange(this.label, this.days);

  final String label;
  final int? days;
}

/// MVRV Index Trend 카드 – 범위 토글 + 라인 차트
class MvrvTrendChartCard extends StatelessWidget {
  const MvrvTrendChartCard({
    super.key,
    required this.range,
    required this.history,
    required this.onRangeChanged,
  });

  final MvrvChartRange range;
  final List<MvrvData> history;
  final ValueChanged<MvrvChartRange> onRangeChanged;

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  'MVRV\nIndex Trend',
                  style: TextStyle(
                    color: DashboardPalette.textPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    height: 1.15,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              _RangeSelector(selected: range, onSelected: onRangeChanged),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _description(range),
            style: const TextStyle(
              color: DashboardPalette.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: _kYAxisWidth,
                  child: _YAxisLabels(history: history),
                ),
                Expanded(child: _TrendChart(history: history)),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: _kYAxisWidth),
            child: _AxisLabels(history: history),
          ),
        ],
      ),
    );
  }

  String _description(MvrvChartRange range) {
    return switch (range) {
      MvrvChartRange.oneMonth =>
        'Institutional valuation variance across 30 days.',
      MvrvChartRange.sixMonths =>
        'Institutional valuation variance across 180 days.',
      MvrvChartRange.oneYear =>
        'Institutional valuation variance across 365 days.',
      MvrvChartRange.all => 'Institutional valuation variance – full history.',
    };
  }
}

class _RangeSelector extends StatelessWidget {
  const _RangeSelector({required this.selected, required this.onSelected});

  final MvrvChartRange selected;
  final ValueChanged<MvrvChartRange> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: DashboardPalette.cardAlt,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final range in MvrvChartRange.values)
            GestureDetector(
              onTap: () => onSelected(range),
              behavior: HitTestBehavior.opaque,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: range == selected
                      ? DashboardPalette.segmentActive
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  range.label,
                  style: TextStyle(
                    color: range == selected
                        ? DashboardPalette.textPrimary
                        : DashboardPalette.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AxisLabels extends StatelessWidget {
  const _AxisLabels({required this.history});

  final List<MvrvData> history;

  @override
  Widget build(BuildContext context) {
    final labels = _labelsFor(history);
    if (labels.isEmpty) return const SizedBox.shrink();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: labels
          .map(
            (label) => Text(
              label,
              style: const TextStyle(
                color: DashboardPalette.textMuted,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          )
          .toList(),
    );
  }

  /// 데이터 양 끝 + 균등 3개 = 총 5개 라벨 (MMM dd)
  List<String> _labelsFor(List<MvrvData> history) {
    if (history.isEmpty) return const [];
    const count = 5;
    if (history.length < count) {
      return history.map(_formatDate).toList();
    }
    return List.generate(count, (i) {
      final idx = ((history.length - 1) * i / (count - 1)).round();
      return _formatDate(history[idx]);
    });
  }

  static const _months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];

  String _formatDate(MvrvData data) {
    final m = _months[data.date.month - 1];
    final d = data.date.day.toString().padLeft(2, '0');
    return '$m $d';
  }
}

/// 차트 좌측 세로축 라벨 (max → min, 4단계)
class _YAxisLabels extends StatelessWidget {
  const _YAxisLabels({required this.history});

  final List<MvrvData> history;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) return const SizedBox.shrink();
    final zscores = history.map((e) => e.mvrvZscore).toList();
    final minV = zscores.reduce(math.min);
    final maxV = zscores.reduce(math.max);
    final flat = (maxV - minV).abs() < 0.001;
    final span = flat ? 1.0 : (maxV - minV);

    const labelStyle = TextStyle(
      color: DashboardPalette.textMuted,
      fontSize: 10,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.4,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final chartHeight = constraints.maxHeight - 2 * _kChartVerticalPadding;
        if (flat) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                maxV.toStringAsFixed(1),
                textAlign: TextAlign.right,
                style: labelStyle,
              ),
            ),
          );
        }
        return Stack(
          children: List.generate(4, (i) {
            final value = maxV - span * (i / 3);
            final y = _kChartVerticalPadding + chartHeight * (i / 3);
            return Positioned(
              top: y - 7,
              left: 0,
              right: 8,
              child: Text(
                value.toStringAsFixed(1),
                textAlign: TextAlign.right,
                style: labelStyle,
              ),
            );
          }),
        );
      },
    );
  }
}

class _TrendChart extends StatelessWidget {
  const _TrendChart({required this.history});

  final List<MvrvData> history;

  @override
  Widget build(BuildContext context) {
    if (history.isEmpty) {
      return const Center(
        child: Text(
          'No data',
          style: TextStyle(
            color: DashboardPalette.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      );
    }
    final series = history.map((e) => e.mvrvZscore).toList();
    return CustomPaint(
      painter: _TrendChartPainter(series),
      size: Size.infinite,
    );
  }
}

class _TrendChartPainter extends CustomPainter {
  _TrendChartPainter(this.series);

  final List<double> series;

  @override
  void paint(Canvas canvas, Size size) {
    if (series.isEmpty) return;

    // Y축 라벨과 정렬되는 차트 영역 (상하 여백 적용)
    final chartTop = _kChartVerticalPadding;
    final chartBottom = size.height - _kChartVerticalPadding;
    final chartHeight = chartBottom - chartTop;

    final gridPaint = Paint()
      ..color = DashboardPalette.divider
      ..strokeWidth = 0.6;
    for (var i = 0; i < 4; i++) {
      final y = chartTop + chartHeight * (i / 3);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    if (series.length == 1) {
      final paint = Paint()
        ..color = DashboardPalette.accent
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        Offset(size.width / 2, chartTop + chartHeight / 2),
        3,
        paint,
      );
      return;
    }

    final minV = series.reduce(math.min);
    final maxV = series.reduce(math.max);
    final span = (maxV - minV).abs() < 0.001 ? 1.0 : (maxV - minV);

    Offset mapPoint(int i) {
      final x = size.width * (i / (series.length - 1));
      final y = chartBottom - ((series[i] - minV) / span) * chartHeight;
      return Offset(x, y);
    }

    // 보조 점선 (dashed baseline)
    final dashPaint = Paint()
      ..color = DashboardPalette.textMuted.withValues(alpha: 0.35)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final dashPath = Path()..moveTo(0, mapPoint(0).dy + 6);
    for (var i = 1; i < series.length; i++) {
      final p = mapPoint(i);
      dashPath.lineTo(p.dx, p.dy + 6);
    }
    _drawDashedPath(canvas, dashPath, dashPaint, dashWidth: 4, gapWidth: 4);

    // 메인 라인
    final linePath = Path()..moveTo(mapPoint(0).dx, mapPoint(0).dy);
    for (var i = 1; i < series.length; i++) {
      final prev = mapPoint(i - 1);
      final curr = mapPoint(i);
      final midX = (prev.dx + curr.dx) / 2;
      linePath.cubicTo(midX, prev.dy, midX, curr.dy, curr.dx, curr.dy);
    }

    final linePaint = Paint()
      ..color = DashboardPalette.accent
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(linePath, linePaint);

    // 라인 아래 은은한 글로우 영역
    final fillPath = Path.from(linePath)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          DashboardPalette.accent.withValues(alpha: 0.18),
          DashboardPalette.accent.withValues(alpha: 0.0),
        ],
      ).createShader(Offset.zero & size);
    canvas.drawPath(fillPath, fillPaint);
  }

  void _drawDashedPath(
    Canvas canvas,
    Path source,
    Paint paint, {
    required double dashWidth,
    required double gapWidth,
  }) {
    for (final metric in source.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + gapWidth;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _TrendChartPainter oldDelegate) =>
      oldDelegate.series != series;
}
