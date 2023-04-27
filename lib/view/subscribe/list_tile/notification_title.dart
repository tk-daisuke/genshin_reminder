import 'package:flutter/material.dart';

class NotificaitonTitle extends StatelessWidget {
  const NotificaitonTitle({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Row(
        children: [
          const Icon(
            Icons.notifications,
          ),
          Flexible(
            child: Text(
              title,
              textScaleFactor: 1,
            ),
          ),
        ],
      ),
    );
  }
}
