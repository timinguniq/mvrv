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

  /// 대시보드 데이터 조회 (BTC 가격 + MVRV Z-Score 병렬)
  Future<void> fetch() async {
    isBusy = true;
    await Future.wait([_fetchBtcPrice(), _fetchMvrv()]);
    isBusy = false;
  }

  Future<void> _fetchBtcPrice() async {
    final result = await locator<BtcPriceUsecase>().execute<Result<BtcPrice>>(
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
}
