import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genshin_reminder/item/user_settings.dart';
import 'package:genshin_reminder/service/auth_service.dart';
import 'package:genshin_reminder/service/error_service.dart';
import 'package:genshin_reminder/service/firebase_analytics.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingViewProvider =
    ChangeNotifierProvider<SettingViewModel>((ref) => SettingViewModel());

class SettingViewModel extends ChangeNotifier {
  final _auth = AuthService();
  final _firestore = FirestoreService();
  final diviceNoticeSetting = true;

  final analytics = AnalyticsService();
  Future<void> updateSetting(
      {required StateController<UserSettings> userSetting,
      required StateController<UserSettings> serverSetting,
      required BuildContext context}) async {
    final _uid = _auth.firebaseUID!;
    try {
      await _firestore.saveSetting(
        uid: _uid,
        settings: userSetting.state,
      );
      await getSetting(
          userSetting: userSetting,
          serverSetting: serverSetting,
          context: context);
      await analytics.sendSettingEvent(
        AnalyticsEvent.notification_add,
      );
    } on FirebaseException catch (e) {
      ErrorService().errorMessageSnackBar(e.code, context);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> getSetting(
      {required StateController<UserSettings> userSetting,
      required StateController<UserSettings> serverSetting,
      required BuildContext context}) async {
    final _uid = _auth.firebaseUID;
    final errorService = ErrorService();

    if (_uid != null) {
      try {
        final setting = await _firestore.getSetting(uid: _uid);
        userSetting.state = setting;
        serverSetting.state = setting;
      } on FirebaseException catch (e) {
        errorService.errorMessageSnackBar(e.code, context);
        notifyListeners();
      }
    }
  }
}
