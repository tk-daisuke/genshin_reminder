import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:genshin_reminder/view/subscribe/header/notification_all_delete.dart';
import 'package:genshin_reminder/view/subscribe/header/notification_count.dart';
import 'package:genshin_reminder/view/subscribe/header/sort_button.dart';
import 'package:genshin_reminder/view/subscribe/list_tile/build_subscrie_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({Key? key}) : super(key: key);
  static const String id = 'subscribe_screen';

  @override
  Widget build(BuildContext context) {
    // final _notificationList = useProvider(providerNotificationList);
    final _l10n = AppLocalizations.of(context);

    return Scaffold(
      // floatingActionButton:
      appBar: AppBar(
        title: Text(
          _l10n?.notification ?? '',
          textScaleFactor: 1,
        ),
        actions: [NotificationAlldelete(l10n: _l10n), _SwipeGuide(l10n: _l10n)],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HookConsumer(builder: (context, ref, child) {
                  return ref.watch(providerGetNotificationList).when(
                    loading: () => const SizedBox(
                      height: 4000,
                    ),
                    error: (e, stack) => const _ErrorWidget(),
                    data: (snapshot) {
                      // final sortedSnapshot = snapshot
                      //   ..sort((a, b) => a.id.compareTo(b.id));
                      final platform = Theme.of(context).platform;

                      return Column(
                        children: [
                          Row(
                            children: [
                              if (platform == TargetPlatform.iOS)
                                Flexible(
                                  // flex: 1,
                                  child: NotificcationCount(
                                      l10n: _l10n, item: snapshot.length),
                                ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                child: SortButton(l10n: _l10n),
                              ),
                            ],
                          ),
                          if (!snapshot.isNotEmpty)
                            //  BuildSubscribeListWidget(snapshot)
                            // else
                            Text(
                              _l10n?.no_registration ?? '',
                              textScaleFactor: 1,
                            ),
                          // Column(
                          //   children: item.isNotEmpty
                          //       ? item
                          //       : [

                          //         ],
                          // ),
                        ],
                      );
                    },
                  );
                }),
                const BuildSubscribeListWidget(),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SwipeGuide extends HookConsumerWidget {
  const _SwipeGuide({
    Key? key,
    required AppLocalizations? l10n,
  })  : _l10n = l10n,
        super(key: key);

  final AppLocalizations? _l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(notificaitonItems.state);
    return _model.state.isNotEmpty
        ? IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    title: Text(_l10n?.swipe_guide_title ?? ''),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image(
                              image: AssetImage(_l10n?.swipe_images ??
                                  'assets/images/app/guide/swipe_en.png'),
                            ),
                          ),
                          // Container(
                          //   // width: double.infinity,
                          //   // height: 200,
                          //   width: 200,
                          //   height: 200,
                          //   decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //           image: ExactAssetImage(_l10n
                          //                   ?.swipe_images ??
                          //               'assets/images/app/guide/swipe_en.png'),
                          //           fit: BoxFit.cover)),
                          // ),
                          Text(_l10n?.swipe_guide_comment ?? ''),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      Center(
                        child: ElevatedButton(
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
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
        : const SizedBox();
  }
}

class _ErrorWidget extends ConsumerWidget {
  const _ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);

    return Column(children: [
      const Text(
        'error',
        textScaleFactor: 1,
      ),
      TextButton(
          onPressed: () => ref.refresh(providerGetNotificationList),
          child: Text(
            _l10n?.reload ?? '',
            textScaleFactor: 1,
          ))
    ]);
  }
}
