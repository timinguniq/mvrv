import 'package:flutter/material.dart';

class BaseViewModel with ChangeNotifier {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  set isBusy(bool isBusy) {
    if (_isBusy == isBusy) return;
    _isBusy = isBusy;
    notifyListeners();
  }

  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
