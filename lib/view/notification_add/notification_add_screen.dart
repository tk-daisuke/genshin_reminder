import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:genshin_reminder/item/material/levelup_material.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:genshin_reminder/view/notification_add/notification_add_model.dart';
import 'package:genshin_reminder/view/notification_add/widget.dart';
import 'package:genshin_reminder/view/widget/domain/domain_info.dart';
import 'package:genshin_reminder/view/widget/lvup_material_avater.dart';
import 'package:genshin_reminder/view/widget/notificaiton/notification_time_editor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationAddScreeen extends StatelessWidget {
  const NotificationAddScreeen({
    required this.talentMaterialData,
    // required this.charactersList,
    Key? key,
  }) : super(key: key);
  static const String id = 'notification_add_screen';
  final LevelUpMaterial talentMaterialData;

  // final List<Character> charactersList;

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_l10n?.notification_registration ?? ''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // _weeksChip(week, Colors.black),
              // const SizedBox(height: 5),
              const _NotificationSet(),

              const Divider(
                thickness: 5,
              ),
              NotificationAddButton(doc: talentMaterialData),
              const Divider(
                thickness: 5,
              ),
              DomainInfo(talentMaterialData: talentMaterialData),
              Container(
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LvupMaterialDetail extends StatelessWidget {
  const LvupMaterialDetail({
    Key? key,
    required this.talentMaterialData,
  }) : super(key: key);

  final LevelUpMaterial talentMaterialData;

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final _model = ref.watch(provideNotificationAdd.notifier);
      final materialName = _model.materialNames(context, talentMaterialData);
      final materialName1 = materialName.materialName1;
      final materialName2 = materialName.materialName2;
      final materialName3 = materialName.materialName3;
      // final id = talentMaterialData.id;
      final isSunday = talentMaterialData.week1 == DateTime.sunday;

      // final String sundayImages;
      // if (isSunday) {
      //   sundayImages =
      //       'assets/images/material/${talentMaterialData.id + 10}.png';
      // } else {
      //   sundayImages = 'assets/images/material/${talentMaterialData.id}.png';
      // }

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LevelUpMaterialDitile(
              path: 'assets/images/material/${talentMaterialData.id}.png',
              materialName1: materialName1,
              materialName2: materialName2,
              materialName3: materialName3,
            ),
            if (isSunday == false)
              weeksChip(_model.getMaterialWeek(context, talentMaterialData),
                  Colors.black),
          ],
        ),
      );
    });
  }
}

class NotificationAddButton extends ConsumerWidget {
  const NotificationAddButton({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final LevelUpMaterial doc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      // final userSetting = useProvider(userSettingProvider.notifier);

      final _l10n = AppLocalizations.of(context);
      final _model = ref.watch(provideNotificationAdd.notifier);
      return ref.watch(providerGetNotificationList).when(
            loading: () => SizedBox(
              height: doc.week2 != DateTime.sunday ? 146 : 73,
            ),
            error: (e, stack) => Column(children: [
              const Text('error'),
              TextButton(
                  onPressed: () =>
                      ref.refresh(providerGetNotificationList),
                  child: Text(_l10n?.reload ?? ''))
            ]),
            data: (snapshot) {
              final notifications = snapshot
                ..sort((a, b) => a.id.compareTo(b.id));
              final week1isLoop = _model.searchNotificationRequest(
                  notifications, doc.week1NotificationLoopID);
              final week1isOnce = _model.searchNotificationRequest(
                  notifications, doc.week1NotificationOnceID);
              final week2isLoop = _model.searchNotificationRequest(
                  notifications, doc.week2NotificationLoopID);
              final week2isOnce = _model.searchNotificationRequest(
                  notifications, doc.week2NotificationOnceID);

              final week1Name = _model.getWeekName(context, doc.week1);
              final week2Name = _model.getWeekName(context, doc.week2);
              return SingleChildScrollView(
                // scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Text(
                      week1Name,
                      textScaleFactor: 1,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _NotificationToggleButton(
                            notificationRequest: week1isLoop,
                            talentMaterialData: doc,
                            notificationType: NotificationType.week1Loop,
                          ),
                          _NotificationToggleButton(
                            notificationRequest: week1isOnce,
                            talentMaterialData: doc,
                            notificationType: NotificationType.week1Once,
                          ),
                        ],
                      ),
                    ),
                    if (doc.week2 != DateTime.sunday)
                      Text(
                        week2Name,
                        textScaleFactor: 1,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    if (doc.week2 != DateTime.sunday)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _NotificationToggleButton(
                                notificationRequest: week2isLoop,
                                talentMaterialData: doc,
                                notificationType: NotificationType.week2Loop),
                            _NotificationToggleButton(
                              notificationRequest: week2isOnce,
                              talentMaterialData: doc,
                              notificationType: NotificationType.week2Once,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          );
  }
}

class _NotificationSet extends StatelessWidget {
  const _NotificationSet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              _l10n?.notification_time ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textScaleFactor: 1,
            ),
            Text(
              _l10n?.next_registration ?? '',
              textScaleFactor: 1,
            ),
          ],
        ),
        const NotificationTimeEditor(),
      ],
    );
  }
}

// class _button extends StatelessWidget {
//   const _button({
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

class _NotificationToggleButton extends HookConsumerWidget {
  const _NotificationToggleButton({
    required this.notificationType,
    required this.talentMaterialData,
    Key? key,
    required this.notificationRequest,
  }) : super(key: key);

  final LevelUpMaterial talentMaterialData;
  final Iterable<PendingNotificationRequest> notificationRequest;
  final NotificationType notificationType;
  // final NotificationValue notificationValue;
  // final String weekName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _l10n = AppLocalizations.of(context);
    final _l10n = AppLocalizations.of(context);
    final _model = ref.watch(provideNotificationAdd.notifier);
    final isLoop = notificationType == NotificationType.week1Loop ||
        notificationType == NotificationType.week2Loop;
    final userSetting = ref.watch(userSettingProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          Text(isLoop ? _l10n?.every_week ?? '' : _l10n?.once_time ?? ''),
          ChoiceChip(
              selectedColor: Colors.lightBlue,
              labelStyle: const TextStyle(color: Colors.white),
              avatar: notificationRequest.isNotEmpty
                  ? const Icon(Icons.notifications_off)
                  : const Icon(Icons.notification_add),
              label: Text(
                notificationRequest.isNotEmpty
                    ? _l10n?.cancel ?? ''
                    : _l10n?.add ?? '',
                textScaleFactor: 1,
              ),
              selected: notificationRequest.isNotEmpty, // 判定
              onSelected: (selected) async {
                await _model.notificationAdd(
                  hasNotification: notificationRequest.isNotEmpty,
                  context: context,
                  doc: talentMaterialData,
                  notificationType: notificationType,
                  userSetting: userSetting,
                );
                ref.refresh(providerGetNotificationList);
              }),
        ],
      ),
    );
  }
}

// Widget weeksChip(String label, Color color) {
//   return Chip(
//     labelPadding: const EdgeInsets.all(2),
//     // avatar: CircleAvatar(
//     //   backgroundColor: Colors.white70,
//     //   child: Text(label[0].toUpperCase()),
//     // ),
//     label: Text(
//       label,
//       style: const TextStyle(
//         color: Colors.white,
//       ),
//     ),
//     backgroundColor: color,
//     elevation: 6,
//     shadowColor: Colors.grey[60],
//     padding: const EdgeInsets.all(8),
//   );
// }
