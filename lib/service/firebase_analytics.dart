// ignore_for_file: constant_identifier_names

import 'package:firebase_analytics/firebase_analytics.dart';

enum AnalyticsEvent {
  button,
  sign_up,
  notification_add,
  notification_edit,
  notification_delete,
  notification_all_delete,
  view_setting_save,
}

class AnalyticsService {
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static final FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> sendButtonEvent({required String buttonName}) async {
    _sendEvent(
        event: AnalyticsEvent.button, parameterMap: {'buttonName': buttonName});
  }

  Future<void> sendSignUpEvent() async {
    _sendEvent(event: AnalyticsEvent.sign_up, parameterMap: {});
  }

  Future<void> sendNotificationAllCancel() async {
    _sendEvent(event: AnalyticsEvent.notification_all_delete, parameterMap: {});
  }

  Future<void> sendNotificationEvent(AnalyticsEvent eventName, int id) async {
    _sendEvent(event: eventName, parameterMap: {'id': id});
  }

  Future<void> sendSettingEvent(
    AnalyticsEvent eventName,
  ) async {
    _sendEvent(event: eventName, parameterMap: {});
  }

  /// イベントを送信する
  /// [event] AnalyticsEvent
  /// [parameterMap] パラメータMap
  Future<void> _sendEvent(
      {required AnalyticsEvent event,
      required Map<String, dynamic> parameterMap}) async {
    final eventName = event.toString().split('.')[1];
    return analytics.logEvent(name: eventName, parameters: parameterMap);
  }
}
