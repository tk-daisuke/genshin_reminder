

import 'package:flutter/material.dart';
class NotificationClock extends StatelessWidget {
  const NotificationClock({
    Key? key,
    required this.notificationTime,
  }) : super(key: key);

  final String notificationTime;

  @override
  Widget build(BuildContext context) {
    return Text(
      notificationTime,
      style: const TextStyle(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
      textScaleFactor: 1,
    );
  }
}
