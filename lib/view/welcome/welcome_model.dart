import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:genshin_reminder/service/auth_service.dart';
import 'package:genshin_reminder/service/error_service.dart';
import 'package:genshin_reminder/service/firebase_analytics.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/view/root/root_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final welcomeProvider = ChangeNotifierProvider<WelcomeModel>((ref) => WelcomeModel());

class WelcomeModel extends ChangeNotifier {
  final _auth = AuthService();

  Future<void> signUp(
    BuildContext context,
  ) async {
    final _firestore = FirestoreService();
    final progress = ProgressHUD.of(context);
    final _l10n = AppLocalizations.of(context);
    final _anal = AnalyticsService();
    final erroService = ErrorService();
    progress!.show();
    _anal.sendSignUpEvent();
    try {
      await _auth.signUpAnonymously();
    } on FirebaseAuthException catch (e) {
      erroService.errorMessageSnackBar(e.code, context);
      progress.dismiss();
      notifyListeners();
    }

    if (await _auth.isAuthStateChanged.first != null) {
      Future.delayed(Duration.zero, () async {
        try {
          final uid = _auth.firebaseUID!;
          await _firestore.signUp(uid);
        } on FirebaseException catch (e) {
          erroService.errorMessageSnackBar(e.code, context);
          progress.dismiss();
          notifyListeners();
        }
        progress.dismiss();
        notifyListeners();
        final snackBarSignup =
            SnackBar(content: Text(_l10n?.has_registered ?? ''));
        ScaffoldMessenger.of(context).showSnackBar(snackBarSignup);
        Navigator.pushNamedAndRemoveUntil(
            context, RootScreen.id, (route) => false);
      });
    } else {
      progress.dismiss();
      notifyListeners();

      const SnackBar(content: Text('error'));
    }
  }
}
