import 'package:flutter/material.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationTimeEditor extends StatelessWidget {
  const NotificationTimeEditor({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.timelapse),
        HookConsumer(builder: (context, ref, child) {
          final _settings = ref.watch(userSettingProvider.state);
          final _noticeTime = TimeOfDay(
              hour: _settings.state.hour, minute: _settings.state.minute);
          return Text(
            _noticeTime.format(context),
            textScaleFactor: 1,
            style: const TextStyle(fontSize: 24),
          );
        }),
        const SizedBox(
          width: 10,
        ),
        HookConsumer(builder: (context, ref, child) {
          final _settings = ref.watch(userSettingProvider.state);
          final _noticeTime = TimeOfDay(
              hour: _settings.state.hour, minute: _settings.state.minute);

          return ElevatedButton(
            child: const Text(
              'edit', textScaleFactor: 1,
              // style:
              //     TextStyle(decoration:
              // TextDecoration.overline),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.black,
              shape: const StadiumBorder(),
            ),
            onPressed: () async {
              final timeOfDay = await showTimePicker(
                context: context,
                initialTime: _noticeTime,
              );
              if (timeOfDay != null) {
                _settings.state = _settings.state.copyWith(
                  hour: timeOfDay.hour,
                  minute: timeOfDay.minute,
                  timezone: _settings.state.timezone,
                );
              }
            },
          );
        }),
      ],
    );
  }
}
