import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificcationCount extends StatelessWidget {
  const NotificcationCount({
    Key? key,
    required AppLocalizations? l10n,
    required this.item,
  })  : _l10n = l10n,
        super(key: key);

  final AppLocalizations? _l10n;
  final int item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${_l10n?.notification} '
          '$item/MAX 64',
          textScaleFactor: 1,
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(_l10n?.notification_64 ?? ''),
                  content: Text(_l10n?.notificaiton_limit ?? ''),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.help_outline,
          ),
        )
      ],
    );
  }
}
