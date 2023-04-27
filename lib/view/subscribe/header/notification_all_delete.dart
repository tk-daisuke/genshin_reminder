import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:genshin_reminder/view/subscribe/subscribe_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationAlldelete extends ConsumerWidget {
  const NotificationAlldelete({
    Key? key,
    required AppLocalizations? l10n,
  })  : _l10n = l10n,
        super(key: key);

  final AppLocalizations? _l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(_l10n?.notification_all_delete_title?? ''),
              content: Text(_l10n?.notification_all_delete_subtitle?? ''),
              actionsPadding: const EdgeInsets.symmetric(horizontal: 20),
              actions: <Widget>[
                ElevatedButton(
                  child: Text(_l10n?.cancel?? ''),
                  onPressed: () => Navigator.pop(context),
                ),
                HookConsumer(builder: (context, ref, child) {
                  final _model = ref.watch(providerSubscribeModel);
                  return ElevatedButton(
                    child: Text(_l10n?.delete?? ''),
                    onPressed: () async {
                      await _model.cancelAllNotifications();
                       ref.refresh(providerGetNotificationList);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  );
                }),
              ],
            );
          },
        );
      },
      icon: const Icon(
        Icons.delete_sweep,
      ),
    );
  }
}
