package com.devjj.platform.mvrv

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider

class MvrvWidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
        widgetData: SharedPreferences
    ) {
        val isDouble = widgetData.getBoolean("home_widget.double.mvrv_zscore", false)
        val displayText = if (isDouble) {
            val rawLong = widgetData.getLong("mvrv_zscore", 0)
            "%.2f".format(java.lang.Double.longBitsToDouble(rawLong))
        } else {
            "--"
        }

        for (appWidgetId in appWidgetIds) {
            val views = RemoteViews(context.packageName, R.layout.mvrv_widget)
            views.setTextViewText(R.id.tv_zscore, displayText)
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
