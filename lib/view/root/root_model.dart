import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genshin_reminder/item/user_settings.dart';
import 'package:genshin_reminder/service/auth_service.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/view/home/home_screen.dart';
import 'package:genshin_reminder/view/welcome/welcome_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rootProvider = ChangeNotifierProvider<RootModel>((ref) => RootModel());
final userStreamProvider = StreamProvider.autoDispose<User?>(
    (ref) => FirebaseAuth.instance.authStateChanges());

class RootModel extends ChangeNotifier {
  final _auth = AuthService();
  final _firestore = FirestoreService();
  Future<void> getSetting({
    required StateController<UserSettings> userSetting,
    required StateController<UserSettings> serverSetting,
  }) async {
    final uid = _auth.currentUserUID;
    if (uid != null) {
      final setting = await _firestore.getSetting(uid: uid);
      userSetting.state = setting;
      serverSetting.state = setting;
    }
  }

  // Future getNotificationList(
  //     StateController<List<PendingNotificationRequest>>
  //         notificationList) async {
  //   final notificationService = NotificationService();
  //   final getList = notificationService.getNotificationList();
  //   notificationList.state = await getList;
  // }

  Future<void> loginCheck(BuildContext context,
      {required StateController<UserSettings> userSetting,
      required StateController<UserSettings> serverSetting,
      User? user}) async {
    // final user = _auth.isAuthStateChanged;
    await getSetting(userSetting: userSetting, serverSetting: serverSetting);
    if (user != null) {
      Future.delayed(
        Duration.zero,
        () => Navigator.pushReplacementNamed(context, HomeScreen.id),
      );
    } else {
      Future.delayed(Duration.zero,
          () => Navigator.pushReplacementNamed(context, WelcomeScreen.id));
    }
  }
}
