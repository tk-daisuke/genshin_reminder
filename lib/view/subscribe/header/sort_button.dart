import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:genshin_reminder/view/subscribe/subscribe_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    Key? key,
    required AppLocalizations? l10n,
  })  : _l10n = l10n,
        super(key: key);

  final AppLocalizations? _l10n;

  @override
  Widget build(BuildContext context) {
    return HookConsumer(builder: (context, ref, child) {
      final sort = ref.watch(subscribeSortProvider.state);
      return ref.watch(providerGetNotificationList).when(
          loading: () => const SizedBox(),
          error: (e, stack) => const _ErrorWidget(),
          data: (snapshot) {
            if (snapshot.length > 2) {
              return TextButton.icon(
                  style: TextButton.styleFrom(
                      // primary: Theme.of(context).colorScheme.background,
                      elevation: 0),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    sort.state = !sort.state;
                    ref.refresh(providerGetNotificationList);
                  },
                  icon: const Icon(Icons.sort, color: Colors.white),
                  label: SizedBox(
                    width: 35,
                    child: sort.state
                        ? const AutoSizeText(
                            ' ID ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        : AutoSizeText(
                            _l10n?.week ?? '',
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ));

              // FloatingActionButton.extended(
              //     isExtended: true,
              //     label: sort.state
              //         ? const Text(
              //             ' ID ',
              //             style: TextStyle(
              //               color: Colors.black,
              //             ),
              //           )
              //         : Text(
              //             _l10n?.week,
              //             style: const TextStyle(
              //               color: Colors.black,
              //             ),
              //           ),
              //     onPressed: () {
              //       HapticFeedback.lightImpact();

              //       sort.state = !sort.state;
              //     },
              //     backgroundColor: Colors.white,
              //     icon: const Icon(
              //       Icons.sort,
              //       color: Colors.black,
              //     ));
            } else {
              return const SizedBox();
            }
          });
    });
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
