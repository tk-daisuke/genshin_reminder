import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:genshin_reminder/view/notification_result/notification_result_screen.dart';

class SlidablePanel extends StatelessWidget {
  const SlidablePanel({
    Key? key,
    required this.child,
    // required this.notificationID,
    // required this.weekID,
    // required this.payload,
    required this.timeEdit,
    required this.stringPayload,
    // required this.animationController,
    required this.delete,
  }) : super(key: key);
  final Widget child;
  // final int notificationID;
  // final int weekID;
  // final NotificationPayload payload;
  final String? stringPayload;
  final VoidCallback timeEdit;
  final VoidCallback delete;
  // final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final _l10n = AppLocalizations.of(context);
    // final slidableControlle = SlidableController(this);
    return InkWell(
      onTap: () async {
        if (stringPayload != null) {
          // await slidableControlle.dismiss(ResizeRequest(Duration.zero, () {}));
          // await slidableControlle.close();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    NotificationResultScreen(payload: stringPayload!)),
          );
        }
      },
      child: Slidable(
        // controller: slidableController,
        actionPane: const SlidableDrawerActionPane(),
        secondaryActions: [
          IconSlideAction(
            caption: 'Edit',
            color: Colors.white,
            foregroundColor: Colors.black,
            icon: Icons.edit,
            onTap: timeEdit,
          ),
          IconSlideAction(
            caption: _l10n?.cancel,
            color: Colors.red,
            icon: Icons.notifications_off,
            onTap: delete,
          ),
        ],
        child: child,
      ),
    );
  }
}
