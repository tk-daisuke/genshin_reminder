import 'package:badges/badges.dart' as badges;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationCountBadge extends ConsumerWidget {
  const NotificationCountBadge({
    Key? key,
    required this.talentMaterialData,
    required this.child,
    required this.position,
  }) : super(key: key);
  final badges.BadgePosition position;
  final LevelUpMaterial talentMaterialData;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);

    return ref.watch(providerGetNotificationList).when(
        loading: () => const SizedBox(),
        error: (e, stack) => Column(children: [
              const Text('error'),
              TextButton(
                  onPressed: () => ref.refresh(providerGetNotificationList),
                  child: Text(_l10n?.reload ?? 'reload'))
            ]),
        data: (snapshot) {
          // final _model = ref.watch(notificaitonItems);
          final notificationList = snapshot
            ..sort((a, b) => a.id.compareTo(b.id));
          final isSunday = talentMaterialData.week1 == DateTime.sunday;
          final week1isLoop = notificationList
              .where((e) => e.id == talentMaterialData.week1NotificationLoopID);
          final week1isOnce = notificationList
              .where((e) => e.id == talentMaterialData.week1NotificationOnceID);
          final week2isLoop = isSunday
              ? <PendingNotificationRequest>[]
              : notificationList.where(
                  (e) => e.id == talentMaterialData.week2NotificationLoopID);
          final week2isOnce = isSunday
              ? <PendingNotificationRequest>[]
              : notificationList.where(
                  (e) => e.id == talentMaterialData.week2NotificationOnceID);
          final badgeText = (week1isLoop.length +
                  week1isOnce.length +
                  week2isOnce.length +
                  week2isLoop.length)
              .toString();
          // final _model =
          //     useProvider(characterScreenWidgetModelProvider.notifier);

          // final materilaName =
          //     _model.getMaterialNames(context, talentMaterialData);

          return badges.Badge(
            position: position,
            badgeContent: Text(
              badgeText,
              textScaleFactor: 1,
            ),
            showBadge: badgeText != '0',
            // position: BadgePosition.topStart(),
            child: badgeText != '0' ? child : const SizedBox(),

            //  SizedBox(
            //   width: 50,
            //   child: Column(
            //     children: [
            //       IconButton(
            //           padding: const EdgeInsets.only(bottom: 8),
            //           // constraints: const BoxConstraints(),
            //           onPressed: () {
            //             Navigator.of(context).push(
            //               MaterialPageRoute(
            //                 builder: (context) {
            //                   return NotificationAddScreeen(
            //                     talentMaterialData: talentMaterialData,
            //                   );
            //                 },
            //               ),
            //             );
            //           },
            //           icon: const Icon(Icons.notifications)),
            //       // Text(
            //       //   _l10n?.notice,
            //       //   textScaleFactor: 1,
            //       // ),
            //     ],
            //   ),
            // ),
          );

          // });
        });
  }
}

// class PushAddScreenButton extends StatelessWidget {
//   const PushAddScreenButton({
//     Key? key,
//     required this.talentMaterialData, required this.child,
//     // required this.materialName,
//     // required this.materialName2,
//     // required this.materialName3,
//   }) : super(key: key);

//   final LevelUpMaterial talentMaterialData;
//   final Widget child;
//   // final String materialName;
//   // final String materialName2;
//   // final String materialName3;

//   @override
//   Widget build(BuildContext context) {
//     final _l10n = AppLocalizations.of(context);

//     return HookBuilder(builder: (context) {
//       return useProvider(providerGetNotificationList).when(
//           loading: () => Column(
//                 children: [
//                   IconButton(
//                       padding: const EdgeInsets.only(bottom: 8),
//                       // constraints: const BoxConstraints(),
//                       onPressed: () {},
//                       icon: const Icon(Icons.notifications)),
//                   Text(
//                     _l10n?.notice,
//                     textScaleFactor: 1,
//                   ),
//                 ],
//               ),
//           error: (e, stack) => Column(children: [
//                 const Text('error'),
//                 TextButton(
//                     onPressed: () =>
//                         context.refresh(providerGetNotificationList),
//                     child: Text(_l10n?.reload))
//               ]),
//           data: (snapshot) {
//             final notificationList = snapshot
//               ..sort((a, b) => a.id.compareTo(b.id));
//             final isSunday = talentMaterialData.week1 == DateTime.sunday;
//             final week1isLoop = notificationList.where(
//                 (e) => e.id == talentMaterialData.week1NotificationLoopID);
//             final week1isOnce = notificationList.where(
//                 (e) => e.id == talentMaterialData.week1NotificationOnceID);
//             final week2isLoop = isSunday
//                 ? <PendingNotificationRequest>[]
//                 : notificationList.where(
//                     (e) => e.id == talentMaterialData.week2NotificationLoopID);
//             final week2isOnce = isSunday
//                 ? <PendingNotificationRequest>[]
//                 : notificationList.where(
//                     (e) => e.id == talentMaterialData.week2NotificationOnceID);
//             final badgeText = (week1isLoop.length +
//                     week1isOnce.length +
//                     week2isOnce.length +
//                     week2isLoop.length)
//                 .toString();
//             // final _model =
//             //     useProvider(characterScreenWidgetModelProvider.notifier);

//             // final materilaName =
//             //     _model.getMaterialNames(context, talentMaterialData);

//             return Badge(
//                 position: BadgePosition.topStart(start: -2, top: -5),
//                 badgeContent: Text(
//                   badgeText,
//                   textScaleFactor: 1,
//                 ),
//                 showBadge: badgeText != '0',
//                 // position: BadgePosition.topStart(),
//                 child: child

//                 //  SizedBox(
//                 //   width: 50,
//                 //   child: Column(
//                 //     children: [
//                 //       IconButton(
//                 //           padding: const EdgeInsets.only(bottom: 8),
//                 //           // constraints: const BoxConstraints(),
//                 //           onPressed: () {
//                 //             Navigator.of(context).push(
//                 //               MaterialPageRoute(
//                 //                 builder: (context) {
//                 //                   return NotificationAddScreeen(
//                 //                     talentMaterialData: talentMaterialData,
//                 //                   );
//                 //                 },
//                 //               ),
//                 //             );
//                 //           },
//                 //           icon: const Icon(Icons.notifications)),
//                 //       // Text(
//                 //       //   _l10n?.notice,
//                 //       //   textScaleFactor: 1,
//                 //       // ),
//                 //     ],
//                 //   ),
//                 // ),
//                 );
//           });
//     });
//   }
// }


          // Column(
          //       children: [
          // IconButton(
          //     padding: const EdgeInsets.only(bottom: 8),
          //     // constraints: const BoxConstraints(),
          //     onPressed: () {},
          //     icon: const Icon(Icons.notifications)),
          // // Text(
          //   _l10n?.notice,
          //   textScaleFactor: 1,
          // ),
          //   ],
          // ),