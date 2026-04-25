import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'dashboard_card.dart';
import 'dashboard_palette.dart';

/// 차트 기간 필터 (대시보드 전용)
enum MvrvChartRange {
  oneMonth('1M', 30),
  sixMonths('6M', 180),
  oneYear('1Y', 365),
  all('ALL', 1500);

  const MvrvChartRange(this.label, this.days);

  final String label;
  final int days;
}

/// MVRV Index Trend 카드 – 범위 토글 + 라인 차트
class MvrvTrendChartCard extends StatefulWidget {
  const MvrvTrendChartCard({
    super.key,
    this.initialRange = MvrvChartRange.oneYear,
  });

  final MvrvChartRange initialRange;

  @override
  State<MvrvTrendChartCard> createState() => _MvrvTrendChartCardState();
}

class _MvrvTrendChartCardState extends State<MvrvTrendChartCard> {
  late MvrvChartRange _range = widget.initialRange;

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
              _RangeSelector(
                selected: _range,
                onSelected: (v) => setState(() => _range = v),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _description(_range),
            style: const TextStyle(
              color: DashboardPalette.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(height: 180, child: _TrendChart(range: _range)),
          const SizedBox(height: 10),
          _AxisLabels(range: _range),
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
  const _AxisLabels({required this.range});

  final MvrvChartRange range;

  @override
  Widget build(BuildContext context) {
    final labels = _labelsForRange(range);
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

  List<String> _labelsForRange(MvrvChartRange range) {
    return switch (range) {
      MvrvChartRange.oneMonth => const ['W1', 'W2', 'W3', 'W4', 'NOW'],
      MvrvChartRange.sixMonths => const ['MAY', 'JUL', 'SEP', 'NOV', 'JAN'],
      MvrvChartRange.oneYear => const [
        'OCT 23',
        'JAN 24',
        'APR 24',
        'JUL 24',
        'OCT 24',
      ],
      MvrvChartRange.all => const ['2018', '2020', '2022', '2024', '2026'],
    };
  }
}

class _TrendChart extends StatelessWidget {
  const _TrendChart({required this.range});

  final MvrvChartRange range;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrendChartPainter(_seriesForRange(range)),
      size: Size.infinite,
    );
  }

  /// 범위별 mock 시리즈 – 시각적 변별력을 위해 결정적으로 생성
  List<double> _seriesForRange(MvrvChartRange range) {
    final seed = range.index + 1;
    final random = math.Random(seed * 31);
    final points = <double>[];
    const count = 60;
    var value = 0.5;
    for (var i = 0; i < count; i++) {
      final progress = i / (count - 1);
      // 완만한 상승 트렌드 + 노이즈
      final trend = 0.5 + progress * 1.6 + (range.index * 0.1);
      value = trend + (random.nextDouble() - 0.5) * 0.35;
      points.add(value);
    }
    return points;
  }
}

class _TrendChartPainter extends CustomPainter {
  _TrendChartPainter(this.series);

  final List<double> series;

  @override
  void paint(Canvas canvas, Size size) {
    if (series.isEmpty) return;

    final gridPaint = Paint()
      ..color = DashboardPalette.divider
      ..strokeWidth = 0.6;
    for (var i = 0; i < 4; i++) {
      final y = size.height * (i / 3);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final minV = series.reduce(math.min);
    final maxV = series.reduce(math.max);
    final span = (maxV - minV).abs() < 0.001 ? 1.0 : (maxV - minV);

    Offset mapPoint(int i) {
      final x = size.width * (i / (series.length - 1));
      final y =
          size.height - ((series[i] - minV) / span) * size.height * 0.85 - 10;
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
