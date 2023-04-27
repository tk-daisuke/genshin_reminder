import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:genshin_reminder/service/notification_service.dart';

class Initialize {
  final _notification = NotificationService();

  Future<void> getTimezone() async => _notification.configureLocalTimeZone();

  // Future<void> configureLocalTimeZone() async {
  //   tz.initializeTimeZones();
  //   final timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  //   tz.setLocalLocation(tz.getLocation(timeZoneName));
  // }

  Future<void> firebaseCrashlyticsInit() async {
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {}
  }

  Future<void> firebaseAnalyticsInit() async {
    if (kDebugMode) {
      await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(false);
    } else {}
  }

  Future<void> firebaseEmulator({required bool isEmulator}) async {
    if (isEmulator) {
      // ignore: avoid_print
      print('isEmulator$isEmulator');
      const localhost = 'localhost';

      FirebaseFirestore.instance.useFirestoreEmulator(localhost, 8080);
      await Future.wait(
        [FirebaseAuth.instance.useAuthEmulator(localhost, 9099)],
      );
    }
  }

  Future<void> addLicense() async {
    LicenseRegistry.addLicense(() async* {
      final license =
          await rootBundle.loadString('licenses/google_fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
      final license2 =
          await rootBundle.loadString('licenses/google_fonts/OFL2.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license2);
      final license3 = await rootBundle.loadString('licenses/figma.txt');
      yield LicenseEntryWithLineBreaks(['Mockups'], license3);
    });
  }

  Future<void> firebaseLoginCheck() async {
    if (kDebugMode) {
      FirebaseAuth.instance.userChanges().listen((final User? _firebaseUser) {
        if (_firebaseUser != null) {
          // ignore: avoid_print
          print(_firebaseUser);
          // ignore: avoid_print
          print('User sign in');
        } else {
          // ignore: avoid_print
          print(_firebaseUser);
          // ignore: avoid_print
          print('User sign out');
        }
      });
    } else {}
  }
}
