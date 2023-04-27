import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/item/notification_payload.dart';
import 'package:genshin_reminder/view/subscribe/list_tile/notificatio_clock.dart';
import 'package:genshin_reminder/view/subscribe/list_tile/notification_week.dart';
import 'package:genshin_reminder/view/subscribe/subscribe_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificaitonTimeDetail extends HookConsumerWidget {
  const NotificaitonTimeDetail({
    Key? key,
    required this.weekName,
    required this.notificationPayload,
  }) : super(key: key);

  final String weekName;
  final NotificationPayload notificationPayload;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);

    final _model = ref.watch(providerSubscribeModel);
    final registeredTime = _model.getRegisteredNotificationTime(
      notificationPayload.weekID,
      notificationPayload.userSettings.hour,
      notificationPayload.userSettings.minute,
      notificationPayload.location,
    );
    final timeCheck = _model.timeCheck(notificationPayload);
    //TZがずれたときに参照
    final registToLocalTime =
        DateTime.parse(registeredTime.toIso8601String()).toLocal();
    final localTime = DateFormat('yy-MM-dd').format(registToLocalTime);
    final localTime2 = DateFormat('HH:mm').format(registToLocalTime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        NotificationWeek(
          weekName: weekName,
          loop: notificationPayload.loopFlag,
        ),
        // _WeekName(weekName: weekName),
        Row(
          children: [
            const Icon(Icons.timelapse),
            NotificationClock(
                notificationTime: TimeOfDay(
                        hour: registeredTime.hour,
                        minute: registeredTime.minute)
                    .format(context)),
            if (timeCheck)
              Text(
                notificationPayload.timezone,
                textScaleFactor: 1,
              ),
          ],
        ),
        if (timeCheck)
          Row(
            children: [
              const Icon(
                Icons.warning_outlined,
                size: 15,
              ),
              Flexible(
                child: AutoSizeText(_l10n?.different_time_zone?? '',
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
        if (timeCheck)
          Flexible(
            child: AutoSizeText(_l10n?.different_time_zone_readme?? '',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),

        if (timeCheck)
          Wrap(
            children: [
              Text(
                tz.local.currentTimeZone.abbreviation,
                textScaleFactor: 1,
              ),
              Text(
                localTime,
                textScaleFactor: 1,
              ),
              Text(
                ' $localTime2',
                textScaleFactor: 1,
              ),
            ],
          ),
        // Text(notificationPayload.location)
      ],
    );
  }
}
