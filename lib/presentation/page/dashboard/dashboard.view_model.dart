part of 'dashboard.page.dart';

/// 대시보드 화면 ViewModel
class DashboardViewModel extends BaseViewModel {
  DashboardViewModel(){
    unawaited(fetch());
  }

  BtcPrice? _btcPrice;

  BtcPrice? get btcPrice => _btcPrice;

  void updateBtcPrice(BtcPrice value){
    if(_btcPrice != value){
      _btcPrice = value;
      notifyListeners();
    }
  }

  /// 비트코인 현재가 재조회
  Future<void> fetch() async {
    isBusy = true;
    final result = await locator<BtcPriceUsecase>().execute<Result<BtcPrice>>(
      usecase: GetBtcPriceUsecase(),
    );

    result.when(
      success: (data) {
        updateBtcPrice(data);
        isBusy = false;
      },
      failure: (error) {
        log('GetBtcPriceUsecase error : $error');
        isBusy = false;
      },
    );
  }
}