// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:genshin_reminder/item/material/levelup_material_types.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:genshin_reminder/view/subscribe/list_tile/animation_container.dart';
import 'package:genshin_reminder/view/subscribe/list_tile/notification_time_detail.dart';
import 'package:genshin_reminder/view/subscribe/list_tile/notification_title.dart';
import 'package:genshin_reminder/view/subscribe/slider/slider_panel.dart';
import 'package:genshin_reminder/view/subscribe/subscribe_model.dart';
import 'package:genshin_reminder/view/widget/lvup_material_avater.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BuildSubscribeListWidget extends HookConsumerWidget {
  const BuildSubscribeListWidget(
      // this.doc,
      {Key? key})
      : super(key: key);
  // final List<PendingNotificationRequest> doc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doc = ref.read(notificaitonItems.notifier).state;
    ref.watch(providerSubscribeModel);
    final _setting = ref.watch(userSettingProvider.notifier);


    // lengthが減ったら再構築
    // deleteの際に再構築
    // TODO(user): 個別に出来るようにしたいEditの場合は実装済
    ref.watch(
        sortedListProvider.select<bool>((value) => value.length != doc.length));

    // final sort = ref.watch(subscribeSortProvider.state);
    final sortItems = ref.read(sortedListProvider.state);
    // if (sort.state) {
    //   sortItems.state.sort((a, b) => a.id.compareTo(b.id));
    // } else {
    //   sortItems.state
    //       .sort((a, b) => a.payload.weekID.compareTo(b.payload.weekID));
    // }
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: sortItems.state.length,
        itemBuilder: (listContext, index) {
          if (doc.isNotEmpty) {
            return Consumer(builder: (context, ref, child) {
              final sortItems = ref.watch(sortedListProvider.state);

              return ProviderScope(
                  overrides: [
                    currentPayload
                        .overrideWithValue(sortItems.state[index].payload),
                  ],
                  child: Consumer(builder: (context, ref, child) {
                    final payload = ref.watch(currentPayload);
                    final _model = SubscirebeModel();

                    // final payloadToJSON = _model.payloadToJSON(nowPayload);
                    // final payload = _model.payloadMapToClass(payloadToJSON);
                    final weekName =
                        _model.getWeekName(context, payload.weekID);

                    const character = LevelUpMaterialType.character;
                    final materialTypeID =
                        payload.levelUpMaterial.materialTypeID;

                    final _l10n = AppLocalizations.of(context);

                    return AnimationContainer(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NotificaitonTitle(
                            title: materialTypeID == character
                                ? _l10n?.talent_level_up_material ?? ''
                                : _l10n?.weapon_materials ?? '',
                            color: materialTypeID == character
                                ? Colors.lightBlue
                                : const Color(0xFFFF6F00),
                          ),
                          SlidablePanel(
                            timeEdit: () async {
                              await _model.editNotificaiton(
                                  context, _setting, payload);
                              ref.refresh(providerGetNotificationList);
                            },
                            delete: () async {
                              await _noticeCancelDialog(
                                  context, payload.noticeID);
                              ref.refresh(providerGetNotificationList);
                            },
                            // notificationID: payload.noticeID,
                            // weekID: payload.weekID,
                            // payload: payload,
                            stringPayload: jsonEncode(payload.toJson()),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: payload.weekID != DateTime.sunday
                                        ? LvupMaterialAvater(
                                            talentMaterialData:
                                                payload.levelUpMaterial,
                                            id: payload.levelUpMaterial.id,
                                            onChip: false,
                                          )
                                        : Column(
                                            children: [
                                              Image(
                                                // width: 260,
                                                image: AssetImage(
                                                    'assets/images/material/${payload.levelUpMaterial.id}.png'),
                                              ),
                                              const Text(
                                                'ALL',
                                                textScaleFactor: 1,
                                              ),
                                            ],
                                          ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: NotificaitonTimeDetail(
                                      weekName: weekName,
                                      notificationPayload: payload,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
                  // item.length > index ? item[index] : const SizedBox(),
                  );
            });
          } else {
            return const SizedBox();
          }
        });
  }
}

// List<AnimationContainer> buildSubscrieList(
//   WidgetRef ref,
//   List<PendingNotificationRequest> sortedSnapshot,
//   // SubscirebeModel _model,
//   BuildContext context,
//   StateController<UserSettings> _setting,
//   // AnimationController animationController,
//   // GlobalKey<AnimatedListState> listKey,
//   // int index,
// ) {
//   final _model = SubscirebeModel();
//   return sortedSnapshot.map((doc) {
//     final payloadToJSON = _model.payloadToJSON(doc.payload!);
//     final payload = _model.payloadMapToClass(payloadToJSON);
//     final weekName = _model.getWeekName(context, payload.weekID);

//     const character = LevelUpMaterialType.character;
//     final materialTypeID = payload.levelUpMaterial.materialTypeID;

//     final _l10n = AppLocalizations.of(context);

//     return AnimationContainer(
//       notificationID: payload.noticeID,
//       weekID: payload.weekID,
//       // hour: payload.userSettings.notificationHour,
//       // minutes: payload.userSettings.minute,
//       // payload: doc.payload!,
//       child: Column(
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           NotificaitonTitle(
//             title: materialTypeID == character
//                 ? _l10n?.talent_level_up_material ?? ''
//                 : _l10n?.weapon_materials ?? '',
//             color: materialTypeID == character
//                 ? Colors.lightBlue
//                 : const Color(0xFFFF6F00),
//           ),
//           SlidablePanel(
//             timeEdit: () async {
//               await _model.editNotificaiton(context, _setting, payload);
//               ref.refresh(providerGetNotificationList);
//             },
//             delete: () async {
//               await _noticeCancelDialog(context, payload.noticeID);
//               ref.refresh(providerGetNotificationList);
//             },
//             notificationID: payload.noticeID,
//             weekID: payload.weekID,
//             payload: payload,
//             stringPayload: doc.payload,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 10,
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: payload.weekID != DateTime.sunday
//                         ? LvupMaterialAvater(
//                             talentMaterialData: payload.levelUpMaterial,
//                             id: payload.levelUpMaterial.id,
//                             onChip: false,
//                           )
//                         : Column(
//                             children: [
//                               Image(
//                                 // width: 260,
//                                 image: AssetImage(
//                                     'assets/images/material/${payload.levelUpMaterial.id}.png'),
//                               ),
//                               const Text(
//                                 'ALL',
//                                 textScaleFactor: 1,
//                               ),
//                             ],
//                           ),
//                   ),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     flex: 4,
//                     child: NotificaitonTimeDetail(
//                       weekName: weekName,
//                       notificationPayload: payload,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }).toList();
// }

Future _noticeCancelDialog(BuildContext context, int notificationID) async {
  final _l10n = AppLocalizations.of(context);

  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text(_l10n?.notification_cancel_dialog ?? ''),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          // ボタン領域

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(_l10n?.cancel ?? ''),
          ),
          HookBuilder(builder: (context) {
            final _model = SubscirebeModel();

            return ElevatedButton(
              onPressed: () async {
                await _model.cancelNotificaiton(notificationID, context);
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            );
          }),
        ],
      );
    },
  );
}
