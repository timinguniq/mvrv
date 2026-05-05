part of 'dashboard.page.dart';

/// 대시보드 화면 ViewModel
class DashboardViewModel extends BaseViewModel {
  DashboardViewModel() {
    unawaited(fetch());
  }

  BtcPrice? _btcPrice;
  BtcPrice? get btcPrice => _btcPrice;

  MvrvData? _mvrv;
  MvrvData? get mvrv => _mvrv;

  List<MvrvData>? _mvrvHistory;
  List<MvrvData>? get mvrvHistory => _mvrvHistory;

  MvrvChartRange _chartRange = MvrvChartRange.oneMonth;
  MvrvChartRange get chartRange => _chartRange;

  /// 비트코인 최대 공급량 (실제 채굴 한도)
  static const _btcMaxSupply = 21000000;

  /// Delta Cap 근사값 (USD) = 현재가 × 2,100만
  /// BTC 가격 미수신 시 null.
  double? get deltaCap =>
      _btcPrice == null ? null : _btcPrice!.price * _btcMaxSupply;

  void updateBtcPrice(BtcPrice value) {
    if (_btcPrice != value) {
      _btcPrice = value;
      notifyListeners();
    }
  }

  void updateMvrv(MvrvData value) {
    if (_mvrv != value) {
      _mvrv = value;
      notifyListeners();
    }
  }

  void updateMvrvHistory(List<MvrvData> value) {
    _mvrvHistory = value;
    notifyListeners();
  }

  /// 차트 기간 변경 → 해당 범위로 히스토리 재조회
  Future<void> changeChartRange(MvrvChartRange range) async {
    if (_chartRange == range) return;
    _chartRange = range;
    notifyListeners();
    await _fetchHistory();
  }

  /// 대시보드 데이터 조회 (BTC 가격 + MVRV 현재값 + MVRV 히스토리 병렬)
  Future<void> fetch() async {
    isBusy = true;
    await Future.wait([_fetchBtcPrice(), _fetchMvrv(), _fetchHistory()]);
    isBusy = false;
  }

  Future<void> _fetchBtcPrice() async {
    final result = await locator<MvrvUsecase>().execute<Result<BtcPrice>>(
      usecase: GetBtcPriceUsecase(),
    );
    result.when(
      success: updateBtcPrice,
      failure: (error) => log('GetBtcPriceUsecase error : $error'),
    );
  }

  Future<void> _fetchMvrv() async {
    final result = await locator<MvrvUsecase>().execute<Result<MvrvData>>(
      usecase: GetCurrentMvrvUsecase(),
    );
    result.when(
      success: updateMvrv,
      failure: (error) => log('GetCurrentMvrvUsecase error : $error'),
    );
  }

  Future<void> _fetchHistory() async {
    final to = DateTime.now();
    final from = _chartRange.days == null
        ? null
        : to.subtract(Duration(days: _chartRange.days!));

    final result = await locator<MvrvUsecase>().execute<Result<List<MvrvData>>>(
      usecase: GetMvrvHistoryUsecase(from: from, to: to),
    );
    result.when(
      success: updateMvrvHistory,
      failure: (error) => log('GetMvrvHistoryUsecase error : $error'),
    );
  }
}
