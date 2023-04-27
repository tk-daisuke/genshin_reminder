import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/service/auth_service.dart';
import 'package:genshin_reminder/service/url.dart';
import 'package:genshin_reminder/view/character/character_screen.dart';
import 'package:genshin_reminder/view/setting/setting_screen.dart';
import 'package:genshin_reminder/view/subscribe/subscribe_sceen.dart';
import 'package:genshin_reminder/view/weapon/weapon_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomIndex = StateProvider<int>((ref) => 0);
final homeProvider = ChangeNotifierProvider((ref) => HomeModel());

class HomeModel extends ChangeNotifier {
  final _auth = AuthService();

  String? get getUID => _auth.firebaseUID;

  final pageWidgets = [
    const CharacterScreen(),
    const WeaponScreen(),
    // if (!kReleaseMode) const DebugScreen(),
    const SubscribeScreen(),
    const SettingScreen()
  ];
  void dialogA(BuildContext context) {
    final _l10n = AppLocalizations.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        final title = _l10n?.request_update_title ?? '';
        final message = _l10n?.request_update_comment ?? '';
        final btnLabel = _l10n?.request_update_button ?? '';
        final _url = UrlLaunch();

        return AlertDialog(
          title: Text(
            title,
            textScaleFactor: 1,
          ),
          content: Text(
            message,
            textScaleFactor: 1,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Center(
                child: Text(
                  btnLabel,
                  textScaleFactor: 1,
                  // style: TextStyle(color: kButtonText),
                ),
              ),
              onPressed: () =>
                  _url.launchURL('https://apps.apple.com/app/id1588262189'),
            ),
          ],
        );
      },
    );
  }
}
