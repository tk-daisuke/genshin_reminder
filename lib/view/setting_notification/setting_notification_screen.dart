import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/view/setting_notification/setting_notification_model.dart';
import 'package:genshin_reminder/view/widget/notificaiton/notification_time_editor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingNotificaitonScreen extends HookConsumerWidget {
  const SettingNotificaitonScreen({Key? key}) : super(key: key);
  static const String id = 'setting_notification_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSetting = ref.watch(userSettingProvider.notifier);
    final serverSetting = ref.watch(userSettingServersProvider.notifier);

    final model = ref.watch(settingNotificationProvider);
    final _l10n = AppLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async {
        userSetting.state = serverSetting.state;
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _l10n?.notification_setting ?? '',
            textScaleFactor: 1,
          ),
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.arrow_back,
          //   ),
          //   onPressed: () {
          //     userSetting.state = serverSetting.state;
          //     Navigator.of(context).pop();
          //   },
          // ),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                if (userSetting.state != serverSetting.state) {
                  await model.updateSetting(
                      userSetting: userSetting,
                      serverSetting: serverSetting,
                      context: context);
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_l10n?.saveving ?? ''),
                  ),
                );
              },
              icon: const Icon(
                Icons.save,
              ),
              label: Text(
                _l10n?.save ?? '',
                textScaleFactor: 1,
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _l10n?.device_settigs ?? '',
                  textScaleFactor: 1,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Text(
                  _l10n?.notificatin_setting_readme ?? '',
                  textScaleFactor: 1,
                ),
                ElevatedButton(
                  onPressed: AppSettings.openAppSettings,
                  child: Text(
                    _l10n?.push_device_setting ?? '',
                    textScaleFactor: 1,
                  ),
                ),
                const Divider(),
                Text(
                  _l10n?.default_time_setting ?? '',
                  textScaleFactor: 1,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  _l10n?.next_registration ?? '',
                  textScaleFactor: 1,
                ),
                const NotificationTimeEditor(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: unused_element
// class _timezoneDropDownButton extends HookWidget {
//   const _timezoneDropDownButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final userSetting = useProvider(userSettingProvider);

//     final _settingModel = SettingModel();
//     final _timezone = _settingModel.timezone;

//     return DropdownButton<String>(
//       value: userSetting.state.timezone,
//       items: _timezone.map((String doc) {
//         return DropdownMenuItem(
//             value: doc,
//             child: Text(
//               doc,
//               textScaleFactor: 1,
//             ));
//       }).toList(),
//       onChanged: (value) {
//         if (value != null) {
//           userSetting.state = UserSettings(noticeTime: ,
//               notificationHour: userSetting.state.notificationHour,
//               timezone: value,
//               appBadge: userSetting.state.appBadge,
//               minute: userSetting.state.minute);
//         }
//       },
//     );
//   }
// }

// class HourDropDownButton extends HookWidget {
//   const HourDropDownButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _times = SettingModel().times;
//     final userSetting = useProvider(userSettingProvider);

//     return DropdownButton<int>(
//         value: userSetting.state.notificationHour,
//         items: _times
//             .map(
//               (int doc) => DropdownMenuItem(
//                 value: doc,
//                 child: Text(
//                   '${doc}',
//                   textScaleFactor: 1,
//                   style: const TextStyle(fontSize: 20),
//                 ),
//               ),
//             )
//             .toList(),
//         onChanged: (value) {
//           if (value != null) {
//             userSetting.state = UserSettings(
//                 notificationHour: value,
//                 timezone: userSetting.state.timezone,
//                 appBadge: userSetting.state.appBadge,
//                 minute: userSetting.state.minute);
//           }
//         });
//   }
// }

// class MinutesDropDownButton extends HookWidget {
//   const MinutesDropDownButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _minutes = SettingModel().minutes;
//     final userSetting = useProvider(userSettingProvider);

//     return DropdownButton<int>(
//         value: userSetting.state.minute,
//         items: _minutes
//             .map(
//               (int doc) => DropdownMenuItem(
//                 value: doc,
//                 child: Text(
//                   '${doc}',
//                   style: const TextStyle(fontSize: 20),
//                   textScaleFactor: 1,
//                 ),
//               ),
//             )
//             .toList(),
//         onChanged: (value) {
//           if (value != null) {
//             userSetting.state = UserSettings(
//                 notificationHour: userSetting.state.notificationHour,
//                 timezone: userSetting.state.timezone,
//                 appBadge: userSetting.state.appBadge,
//                 minute: value);
//           }
//         });
//   }
// }
