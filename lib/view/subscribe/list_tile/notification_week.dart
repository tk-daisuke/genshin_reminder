import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationWeek extends StatelessWidget {
  const NotificationWeek({
    Key? key,
    required this.weekName,
    required this.loop,
  }) : super(key: key);

  final String weekName;
  final bool loop;

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);

    return Row(
      children: [
        const Icon(
          Icons.event,
          size: 20,
        ),
        Text(
          '$weekName ',
          style: const TextStyle(color: Colors.white, fontSize: 15),
          textScaleFactor: 1,
        ),
        const Icon(
          Icons.notifications,
          size: 20,
        ),
        Text(
          loop ? _l10n?.weekly ?? '' : _l10n?.only_once ?? '',
          style: const TextStyle(color: Colors.white, fontSize: 15),
          textScaleFactor: 1,
        ),
      ],
    );
  }
}
