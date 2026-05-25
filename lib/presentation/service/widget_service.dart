import 'dart:io';

import 'package:home_widget/home_widget.dart';

class WidgetService {
  static const _appGroupId = 'group.com.devjj.platform.mvrv';
  static const _keyMvrvZscore = 'mvrv_zscore';

  static Future<void> initialize() async {
    if (Platform.isIOS) {
      await HomeWidget.setAppGroupId(_appGroupId);
    }
  }

  static Future<void> saveMvrvZscore(double value) async {
    await HomeWidget.saveWidgetData(_keyMvrvZscore, value);
    await HomeWidget.updateWidget(
      iOSName: 'MvrvWidget',
      androidName: 'MvrvWidgetProvider',
    );
  }
}
