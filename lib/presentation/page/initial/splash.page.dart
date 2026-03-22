import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_flutter_app/core/core.dart';
import 'package:base_flutter_app/presentation/presentation.dart';

final _logger = CustomLogger.create(tag: (SplashPage).toString());

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with TickerProviderStateMixin {
  static const _animationTime = 2500;

  late AnimationController _mainController;
  late AnimationController _loadingController;
  late Animation<double> _logoFadeIn;
  late Animation<double> _logoScale;
  late Animation<double> _titleFadeIn;
  late Animation<double> _subtitleFadeIn;
  late Animation<double> _bottomFadeIn;
  late Animation<double> _loadingProgress;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      duration: const Duration(milliseconds: _animationTime),
      vsync: this,
    );

    _loadingController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    // 로고 페이드인 + 스케일
    _logoFadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0, 0.3, curve: Curves.easeOut),
      ),
    );
    _logoScale = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0, 0.3, curve: Curves.easeOutBack),
      ),
    );

    // 타이틀 페이드인
    _titleFadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );

    // 서브타이틀 페이드인
    _subtitleFadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.35, 0.6, curve: Curves.easeOut),
      ),
    );

    // 하단 영역 페이드인
    _bottomFadeIn = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.5, 0.8, curve: Curves.easeOut),
      ),
    );

    // 로딩 프로그레스
    _loadingProgress = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _loadingController,
        curve: Curves.easeInOut,
      ),
    );

    _mainController.forward();
    _loadingController.forward();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => unawaited(appInitialize()));
  }

  @override
  void dispose() {
    _mainController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: Stack(
        children: [
          // 배경 그라디언트
          _buildBackground(),
          // 배경 격자 패턴
          _buildGridPattern(),
          // 메인 컨텐츠
          _buildContent(),
          // 하단 정보
          _buildBottomInfo(),
        ],
      ),
    );
  }

  /// 배경 그라디언트
  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.2),
          radius: 1.2,
          colors: [
            Color(0xFF141B2D),
            Color(0xFF0A0E1A),
          ],
        ),
      ),
    );
  }

  /// 배경 격자 패턴
  Widget _buildGridPattern() {
    return Positioned.fill(
      child: CustomPaint(
        painter: _GridPatternPainter(),
      ),
    );
  }

  /// 메인 컨텐츠 (로고 + 타이틀)
  Widget _buildContent() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 비트코인 아이콘
          FadeTransition(
            opacity: _logoFadeIn,
            child: ScaleTransition(
              scale: _logoScale,
              child: _buildBitcoinIcon(),
            ),
          ),
          const SizedBox(height: 32),
          // SOVEREIGN VAULT 타이틀
          FadeTransition(
            opacity: _titleFadeIn,
            child: const Text(
              'SOVEREIGN VAULT',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: 1.5,
                height: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // MVRV INDEX 서브타이틀
          FadeTransition(
            opacity: _subtitleFadeIn,
            child: const Text(
              'M V R V   I N D E X',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF6B7A99),
                letterSpacing: 6,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 비트코인 아이콘 컨테이너
  Widget _buildBitcoinIcon() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF1E2537),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF9500).withValues(alpha: 0.15),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          '₿',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Color(0xFFFF9500),
            height: 1.0,
          ),
        ),
      ),
    );
  }

  /// 하단 정보 영역
  Widget _buildBottomInfo() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: SafeArea(
        child: FadeTransition(
          opacity: _bottomFadeIn,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 로딩 프로그레스 바
                AnimatedBuilder(
                  animation: _loadingController,
                  builder: (context, _) => _buildProgressBar(),
                ),
                const SizedBox(height: 16),
                // 하단 텍스트 정보
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ENCRYPTED CONNECTION
                    Row(
                      children: [
                        Icon(
                          Icons.shield_outlined,
                          size: 14,
                          color: const Color(0xFFFF9500).withValues(alpha: 0.8),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'ENCRYPTED CONNECTION',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFF9500).withValues(alpha: 0.8),
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    // NODE 정보
                    Row(
                      children: [
                        Text(
                          'NODE: 0X21F...',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.4),
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF00E676),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 프로그레스 바
  Widget _buildProgressBar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: 0.35,
        child: Container(
          height: 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Colors.white.withValues(alpha: 0.05),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
              widthFactor: _loadingProgress.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFF9500),
                      Color(0xFFFF6A13),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> appInitialize() async {
    _logger.i('appInitialize() : start.');
    // 앱 업데이트가 필요한 경우 초기화 중단.
    await postLaunchSetup();

    // 로딩 애니메이션 완료 대기
    await Future.delayed(const Duration(milliseconds: _animationTime));
    CRoute.redirectToDashboard();
    _logger.d('App initialize end');
  }

  Future<void> postLaunchSetup() async {
    _logger.i('postLaunchSetup() : start.');
    final result = await RemoteConfig.checkServiceAvailable();
    _logger.d('postLaunchSetup : checkServiceAvailable=$result');
    if (result != true) {
      Future.delayed(const Duration(seconds: 1), () => exit(0));
      return;
    }

    final storage = await LocalStorage.getInstance();
    final environmentType = RemoteConfig.getAppEnvironment();
    EnvironmentConfig.initialize(environmentType);
    configureDependencyInjection(storage);
  }
}

/// 배경 격자 패턴 페인터
class _GridPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1A2035).withValues(alpha: 0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    // 하단 영역에 격자 사각형 그리기
    final centerX = size.width / 2;
    final centerY = size.height * 0.75;
    const squareSize = 60.0;
    const gap = 12.0;
    const radius = 12.0;

    // 두 개의 사각형
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX - squareSize / 2 - gap / 2, centerY),
          width: squareSize,
          height: squareSize,
        ),
        const Radius.circular(radius),
      ),
      paint,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(centerX + squareSize / 2 + gap / 2, centerY),
          width: squareSize,
          height: squareSize,
        ),
        const Radius.circular(radius),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
