// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:genshin_reminder/item/notification_value.dart';
// import 'package:genshin_reminder/item/user_settings.dart';
// import 'package:genshin_reminder/service/auth_service.dart';
// import 'package:genshin_reminder/service/firestore_service.dart';
// import 'package:genshin_reminder/view/debug/debug_state.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:timezone/timezone.dart' as tz;

// class DebugScreen extends HookWidget {
//   const DebugScreen({Key? key}) : super(key: key);
//   static const String id = 'debug_screen';
//   @override
//   Widget build(BuildContext context) {
//     // final _size = MediaQuery.of(context).size;
//     final viewModel = useProvider(debugProvider.notifier);
//     final userSetting = useProvider(userSettingProvider);

//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // SizedBox(
//               //   height: _size.height / 4,
//               // ),
//               Flexible(
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     await viewModel.showInstantNotification();
//                   },
//                   icon: const Icon(Icons.add),
//                   label: const Text('簡単な通知'),
//                 ),
//               ),
//               Text('${userSetting.state.timezone}'
//                   '${TimeOfDay(hour: userSetting.state.hour, minute: userSetting.state.minute)}'),

//               Text(tz.local.name), Text(tz.local.currentTimeZone.abbreviation),
//               const SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: _WeeklyButtons(),
//               ),
//               Flexible(
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     await viewModel.cancelAllNotifications();
//                   },
//                   icon: const Icon(Icons.add),
//                   label: const Text(
//                     '通知を全部キャンセル',
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       textStyle: const TextStyle(
//                     fontSize: 20,
//                   )),
//                 ),
//               ),
//               // _button(name: '', onPressed: () {}),
//               const SizedBox(
//                 height: 200,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   final _auth = AuthService(FirebaseAuth.instance);
//                   _auth.deleteUser(_auth.firebaseUser);
//                 },
//                 child: const Text('delete user'),
//               ),
//               // SizedBox(
//               //   height: _size.height / 4,
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _WeeklyButtons extends HookWidget {
//   const _WeeklyButtons({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = useProvider(debugProvider.notifier);
//     final userSetting = useProvider(userSettingProvider.notifier);

//     final notifications = _notifications(
//       userSetting,
//     );

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _Button(
//           name: '月',
//           onPressed: () {
//             viewModel.scheduleNotification(notificationValue: notifications[0]);
//           },
//         ),
//         _Button(
//           name: '火',
//           onPressed: () {
//             viewModel.scheduleNotification(notificationValue: notifications[1]);
//           },
//         ),
//         _Button(
//           name: '水',
//           onPressed: () {
//             viewModel.scheduleNotification(notificationValue: notifications[2]);
//           },
//         ),
//         _Button(
//           name: '木',
//           onPressed: () {
//             viewModel.scheduleNotification(notificationValue: notifications[3]);
//           },
//         ),
//         _Button(
//           name: '金',
//           onPressed: () {
//             viewModel.scheduleNotification(notificationValue: notifications[4]);
//           },
//         ),
//         _Button(
//           name: '土',
//           onPressed: () {
//             viewModel.scheduleNotification(notificationValue: notifications[5]);
//           },
//         ),
//         _Button(
//           name: '日',
//           onPressed: () {
//             viewModel.scheduleNotification(notificationValue: notifications[6]);
//           },
//         ),
//       ],
//     );
//   }

//   List<NotificationValue> _notifications(
//     StateController<UserSettings> userSetting,
//   ) {
//     final title = 'タイムゾーン${userSetting.state.timezone}';
//     final noticeTime = TimeOfDay(
//         hour: userSetting.state.hour, minute: userSetting.state.minute);
//     final comment = ' $noticeTime時の通知です';
//     final notifications = [
//       NotificationValue(
//         notificationID: 0,
//         setting: userSetting.state,
//         title: title,
//         comment: '${japaneseWeeklist[DateTime.monday]}$comment',
//         loopFlag: true,
//         payload: '',
//         weekID: DateTime.monday,
//       ),
//       NotificationValue(
//           notificationID: 1,
//           weekID: DateTime.tuesday,
//           setting: userSetting.state,
//           title: title,
//           comment: '${japaneseWeeklist[DateTime.tuesday]}$comment',
//           payload: '',
//           loopFlag: true),
//       NotificationValue(
//           notificationID: 2,
//           weekID: DateTime.wednesday,
//           setting: userSetting.state,
//           title: title,
//           comment: '${japaneseWeeklist[DateTime.wednesday]}$comment',
//           payload: '',
//           loopFlag: true),
//       NotificationValue(
//           notificationID: 3,
//           weekID: DateTime.thursday,
//           setting: userSetting.state,
//           title: title,
//           comment: '${japaneseWeeklist[DateTime.thursday]}$comment',
//           payload: '',
//           loopFlag: true),
//       NotificationValue(
//           notificationID: 4,
//           weekID: DateTime.friday,
//           setting: userSetting.state,
//           title: title,
//           comment: '${japaneseWeeklist[DateTime.friday]}$comment',
//           payload: '',
//           loopFlag: true),
//       NotificationValue(
//           notificationID: 5,
//           weekID: DateTime.saturday,
//           setting: userSetting.state,
//           title: title,
//           comment: '${japaneseWeeklist[DateTime.saturday]}$comment',
//           payload: '',
//           loopFlag: true),
//       NotificationValue(
//           notificationID: 6,
//           weekID: DateTime.sunday,
//           setting: userSetting.state,
//           title: '$title タイトル',
//           comment: '${japaneseWeeklist[DateTime.sunday]}$comment',
//           payload: '',
//           loopFlag: true),
//     ];
//     return notifications;
//   }
// }

// class _Button extends StatelessWidget {
//   const _Button({
//     Key? key,
//     required this.name,
//     required this.onPressed,
//   }) : super(key: key);
//   final String name;
//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 24),
//       child: ElevatedButton.icon(
//         onPressed: onPressed,
//         icon: const Icon(Icons.add),
//         label: Text(name),
//       ),
//     );
//   }
// }
