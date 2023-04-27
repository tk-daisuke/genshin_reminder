import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:genshin_reminder/service/att_service.dart';
import 'package:genshin_reminder/service/error_service.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/view/root/root_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootScreen extends HookConsumerWidget {
  const RootScreen({Key? key}) : super(key: key);
  static const String id = 'root_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final _notificationInitialization =
    //     useProvider(providerNotificationInitialization);
    final _setting = ref.watch(userSettingProvider.notifier);
    final _serversetting = ref.watch(userSettingServersProvider.notifier);
    final attCheck = ref.watch(attProvider);
    // final versionCheck = ref.watch(versionCheckProvider);
    // final user = ref.watch(authenticatorProvider);
    final userStream = ref.watch(userStreamProvider);
    return Scaffold(
        body: attCheck.when(
            loading: () => const _Loading(),
            error: (error, stack) {
              return _ErrorReload(
                  error.toString(), () => ref.refresh(attProvider));
            },
            data: (TrackingStatus value) {
              return userStream.when(
                loading: () => const _Loading(),
                error: (error, stack) {
                  final _eerroService = ErrorService();
                  return _ErrorReload(
                      _eerroService.firebaseErrorSelector(
                          error.toString(), context),
                      () => ref.refresh(userStreamProvider));
                },
                data: (User? data) {
                  ref.watch(rootProvider).loginCheck(context,
                      serverSetting: _serversetting,
                      userSetting: _setting,
                      user: data);
                  return const _Loading();
                },
              );

              //  StreamBuilder<User?>(
              //   stream: FirebaseAuth.instance.authStateChanges(),
              //   builder: (context, snapshot) {
              //     // User is not signed in

              //     // Render your application if authenticated
              //     return const _Loading();
              //   },
              // );
              //
            }));
  }
}

// versionCheck.when(
//     loading: () => const _Loading(),
//     error: (error, stack) {
//       return _ErrorReload(
//           error.toString(), () => ref.refresh(versionCheckProvider));
//     },
// data: (doc) {
//   if (doc == true) {
//     return
//   } else {
//     Future.delayed(Duration.zero, () {
//       dialogA(context);
//     });
//     return const _Loading();
//   }
// },
class _ErrorReload extends ConsumerWidget {
  const _ErrorReload(
    this.error,
    this.onpress, {
    Key? key,
  }) : super(key: key);
  final String error;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_l10n?.too_many_requests ?? 'error'}: $error',
                textScaleFactor: 1),
            ElevatedButton(
                onPressed: onpress,
                child: Text(
                  _l10n?.reload ?? 'relaod',
                  textScaleFactor: 1,
                ))
          ],
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        semanticsLabel: 'Loading',
      ),
    );
  }
}
