import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/constants.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/service/url.dart';
import 'package:genshin_reminder/view/setting_notification/setting_notification_screen.dart';
import 'package:genshin_reminder/view/setting_view/settting_view_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:launch_review/launch_review.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const String id = 'setting_screen';
  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _l10n?.setting ?? '',
          textScaleFactor: 1,
        ),
      ),
      body: const _Settings(),
    );
  }
}

class _Settings extends HookConsumerWidget {
  const _Settings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _url = UrlLaunch();
    final _l10n = AppLocalizations.of(context);
    final userSetting = ref.watch(userSettingProvider.notifier);
    final serverSetting = ref.watch(userSettingServersProvider.notifier);
    // late final Future<PackageInfo> packageInfo = PackageInfo.fromPlatform();

    return SettingsList(
      // backgroundColor: const Color(0xFF212332),
      brightness: Brightness.dark,
      darkTheme: const SettingsThemeData(
          settingsListBackground: Color(0xFF212332),
          titleTextColor: Colors.white,
          dividerColor: Colors.white),
      sections: [
        SettingsSection(
          title: const Text('App'),
          tiles: [
            SettingsTile(
              title: Text(_l10n?.view ?? 'view'),
              leading: const Icon(Icons.crop_original),
              onPressed: (BuildContext context) {
                userSetting.state = serverSetting.state;
                Navigator.of(context).pushNamed(SettingViewScreen.id);
              },
            ),
            SettingsTile(
              title: Text(_l10n?.notification ?? ''),
              leading: const Icon(Icons.notifications),
              onPressed: (BuildContext context) {
                userSetting.state = serverSetting.state;
                Navigator.of(context).pushNamed(SettingNotificaitonScreen.id);
              },
            ),
          ],
        ),
        SettingsSection(
            title: const Text(
              'Contact',
              style: TextStyle(color: Colors.white),
            ),
            tiles: [
              SettingsTile(
                title: Text(
                  _l10n?.issue_feedback ?? '',
                  maxLines: 2,
                ),
                leading: const Icon(
                  Icons.feedback,
                ),
                onPressed: (BuildContext context) =>
                    _url.launchURL(_l10n?.issue_feedback_form ?? ''),
              ),
              SettingsTile(
                title: Text(
                  _l10n?.review ?? '',
                  maxLines: 2,
                ),
                leading: const Icon(
                  Icons.reviews,
                ),
                onPressed: (BuildContext context) => LaunchReview.launch(
                  androidAppId: 'com.setaeet.test',
                  iOSAppId: '1588262189',
                ),
              ),
            ]),
        SettingsSection(
          title: const Text(
            'About',
            style: TextStyle(color: Colors.white),
          ),
          tiles: [
            SettingsTile(
              title: const Text('LICENSE'),
              onPressed: (BuildContext context) {
                showLicensePage(
                  context: context,
                  applicationName: _l10n?.app_name,
                  // TODO(username): version
                  applicationVersion: kAppVersion, // バージョン
                  applicationIcon: const Image(
                    width: 50,
                    image: AssetImage('assets/images/app/Icon.png'),
                  ),
                  applicationLegalese:
                      '©2021 Daisuke Sato \n${_l10n?.genshin_license}', // 権利情報
                );
              },
            ),
            SettingsTile(
              title: Text(_l10n?.termsofservice ?? ''),
              onPressed: (BuildContext context) => _url.launchURL(_l10n
                      ?.terms ??
                  'https://nebula-podium-08d.notion.site/Terms-of-Use-7ad04b59c01e4b11903083b52a1ddc7e'),
            ),
            SettingsTile(
              title: Text(_l10n?.privacypolicy ?? ''),
              onPressed: (BuildContext context) => _url.launchURL(_l10n
                      ?.privacy_polycy ??
                  'https://nebula-podium-08d.notion.site/Privacy-Policy-391bc71be29d44aabed9b20fd02def94'),
            )
          ],
        ),
      ],
    );
  }
}

  //  final _url = UrlLaunch();
  //   Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         TextButton(
  //           onPressed: () => _url.launchURL(kTermsofService),
  //           child: Text(
  //             _l10n?.termsofservice,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //         TextButton(
  //           onPressed: () => _url.launchURL(kPrivacyPolicy),
  //           child: Text(
  //             _l10n?.privacypolicy,
  //             style: const TextStyle(
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         )
  //       ],
  //     ),


      // Container(
          //   height: 44,
          //   margin: const EdgeInsets.all(2),
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     child: Row(
          //       children: const <Widget>[
          //         Expanded(
          //           child: Icon(Icons.ac_unit),
          //         ),
          //         Expanded(
          //           child: AutoSizeText('text',
          //               textScaleFactor: 1,
          //               maxFontSize: 20,
          //               maxLines: 1,
          //               style: const TextStyle(
          //                 fontSize: 20,
          //               )),
          //         ),
          //         Icon(
          //           Icons.arrow_forward_ios,
          //           color: Color(0xFF1C1C1E),
          //           size: 24,
          //         ),
          //         SizedBox(
          //             // width: sized.width * 0.05,
          //             ),
          //       ],
          //     ),
          //     style: ElevatedButton.styleFrom(
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 10,
          //       ),
          //       primary: Color(0xFF1C1C1E),
          //       elevation: 4,
          //       // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //     ),
          //   ),
          // ),
          // Text(
          //   '  widget.label',
          //   overflow: TextOverflow.ellipsis,
          //   // style: widget.labelTextStyle,
          // ),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //     // color: calculateBackgroundColor(context),
          //   ),
          //   // height: widget.subtitle == null ? 44.0 : 57.0,
          //   child: Row(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsetsDirectional.only(
          //           start: 15.0,
          //         ),
          //         child: Icon(
          //           CupertinoIcons.arrow_up_right_diamond_fill,
          //           size: 14,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),