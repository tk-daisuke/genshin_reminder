import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ignore: duplicate_import
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:genshin_reminder/service/url.dart';
import 'package:genshin_reminder/view/welcome/welcome_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _l10n = AppLocalizations.of(context);
    return ProgressHUD(
      child: Builder(
          builder: (context) => Scaffold(
                bottomNavigationBar: const _BottomBar(),
                body: SafeArea(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('R',
                        style: GoogleFonts.shojumaru(
                          fontSize: 100,
                        )),
                    SizedBox(
                      height: _size.height * 0.02,
                    ),
                    Center(
                      child: Text(_l10n?.app_name ?? ''),
                    ),
                    const _SignUp(),
                  ],
                )),
              )),
    );
  }
}

class _SignUp extends HookConsumerWidget {
  const _SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(welcomeProvider);
    final _l10n = AppLocalizations.of(context);

    return ElevatedButton.icon(
      icon: const Icon(
        Icons.login,
      ),
      label: Text(_l10n?.signup ?? ''),
      // style: ElevatedButton.styleFrom(),
      onPressed: () async {
        await _model.signUp(
          context,
        );
      },
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _url = UrlLaunch();
    final _l10n = AppLocalizations.of(context);

    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => _url.launchURL(_l10n?.terms ??
                'https://nebula-podium-08d.notion.site/Terms-of-Use-7ad04b59c01e4b11903083b52a1ddc7e'),
            child: Text(
              _l10n?.termsofservice ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _url.launchURL(_l10n?.privacy_polycy ??
                'https://nebula-podium-08d.notion.site/Privacy-Policy-391bc71be29d44aabed9b20fd02def94'),
            child: Text(
              _l10n?.privacypolicy ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
