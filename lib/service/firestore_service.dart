import 'dart:io' as io;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genshin_reminder/constants.dart';
import 'package:genshin_reminder/item/server_time.dart';
import 'package:genshin_reminder/item/user_settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

// final localSettingProvider =
final userSettingProvider =
    StateProvider<UserSettings>((ref) => const UserSettings(
          timezone: ServerTime.local,
          hour: 12,
          minute: 0,
        ));
final userSettingServersProvider =
    StateProvider<UserSettings>((ref) => const UserSettings(
          timezone: ServerTime.local,
          hour: 12,
          minute: 0,
        ));

// final versionCheckProvider =
//     FutureProvider<bool>((ref) => FirestoreService().versionCheck());

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;
  final serverTimeStamp = FieldValue.serverTimestamp();

  Map<String, dynamic> _firestoreUserSettingToJson(UserSettings settings) {
    final data = settings.toJson();
    data['notificationHour'] = data['hour'];
    data.remove('hour');
    return data;
  }

  UserSettings _firestoreUserSettingFrom(Map<String, dynamic> json) {
    json['hour'] = json['notificationHour'];
    return UserSettings.fromJson(json);
  }

  Future signUp(String _uid) async {
    // final _uid = await auth.firebaseUID!;
    final userDoc = _firestore.collection('users').doc(_uid);
    final settingDoc = _firestore
        .collection('users')
        .doc(_uid)
        .collection('settings')
        .doc('notification');
    await userDoc.set({
      'provider': 'anonymous',
      'createdAt': serverTimeStamp,
    });
    await settingDoc.set({
      'timezone': ServerTime.local,
      'notificationHour': 12,
      'minute': 0,
    });
  }

  Future<UserSettings> getSetting({required String uid}) async {
    final settingDoc = _firestore
        .collection('users')
        .doc(uid)
        .collection('settings')
        .doc('notification');
    final doc = await settingDoc.get();
    if (doc.exists) {
      // final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      final data = doc.data();

      if (data != null) {
        return _firestoreUserSettingFrom(data);
      } else {
        return const UserSettings(
          hour: 12,
          minute: 0,
          timezone: ServerTime.local,
        );
      }
    } else {
      // Firestore にsettingDocが作られていなければこちらを参照
      return const UserSettings(
        hour: 12,
        minute: 0,
        timezone: ServerTime.local,
      );
    }
  }

  Future<bool> versionCheck() async {
    final settingDoc = _firestore.collection('config').doc('update');
    final doc = await settingDoc.get();
    // print(settingDoc);
    // if (doc.exists) {
    // final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (doc.exists) {
      final data = Map<String, dynamic>.from(doc.data()!);
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = Version.parse(packageInfo.version);
      final Version latestVersion;
      if (io.Platform.isIOS) {
        latestVersion = Version.parse(data['ios_version'] ?? kAppVersion);
      } else if (io.Platform.isAndroid) {
        latestVersion = Version.parse(data['android_version']);
      } else {
        latestVersion = Version.parse(data['ios_version'] ?? '1.0.0');
      }
      debugPrint('$latestVersion');
      return !currentVersion.compareTo(latestVersion).isNegative;
    } else {
      return true;
    }
    // if (latestVersion > currentVersion) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<void> saveSetting(
      {required String uid, required UserSettings settings}) async {
    final docData = _firestoreUserSettingToJson(settings);
    final settingDoc = _firestore
        .collection('users')
        .doc(uid)
        .collection('settings')
        .doc('notification');

    final doc = await settingDoc.get();
    if (!doc.exists) {
      final userDoc = _firestore.collection('users').doc(uid);
      await userDoc.set({
        'error': 'error',
        // 'provider': 'anonymous',
        'createdAt': serverTimeStamp,
      });
      await settingDoc.set(docData);
    } else {
      await settingDoc.update(docData);
    }
  }
}
