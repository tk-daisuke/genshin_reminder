import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:genshin_reminder/constants.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:genshin_reminder/service/notification_service.dart';
import 'package:genshin_reminder/view/home/home_model.dart';
import 'package:genshin_reminder/view/notification_result/notification_result_screen.dart';
import 'package:genshin_reminder/view/root/root_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    final _notificationsPlugin = FlutterLocalNotificationsPlugin();
    const _androidSettings = AndroidInitializationSettings('ic_notice');
    //  iOSフォアグラウンド通知を有効にするにはalertをtrueにする
    const _iOSSettings = IOSInitializationSettings();
    const _notificationInitSetting =
        InitializationSettings(android: _androidSettings, iOS: _iOSSettings);
    final _model = HomeModel();
    // final init =
    _notificationsPlugin.initialize(_notificationInitSetting,
        onSelectNotification: (String? payload) async {
      if (payload != null) {
        notificationCheck(_model, payload);
      }
    });
    _notificationsPlugin.getNotificationAppLaunchDetails().then((value) async {
      if (_model.getUID != null && value!.payload != null) {
        // print('value${value.payload}');
        await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  NotificationResultScreen(payload: value.payload!)),
        );
        ref.refresh(providerGetNotificationList);
      }
    });
    Future(() async {
      final doc = FirestoreService().versionCheck();

      if (await doc == false) {
        Future.delayed(Duration.zero, () {
          HomeModel().dialogA(context);
        });
      }
    });

    super.initState();
  }

  void notificationCheck(HomeModel _model, String payload) {
    //不正なログインをブロック
    if (_model.getUID != null) {
      //ネスト防止
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => NotificationResultScreen(payload: payload)),
        ModalRoute.withName(HomeScreen.id),
      );

      ref.refresh(providerGetNotificationList);
    } else {
      Future.delayed(Duration.zero,
          () => Navigator.pushReplacementNamed(context, RootScreen.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _index = ref.watch(bottomIndex.state);
    final _model = ref.watch(homeProvider.notifier);
    return Scaffold(
      // appBar: _appBar(),
      bottomNavigationBar: BottomNavigationItems(
        index: _index,
      ),
      // _buttomNavigator(_index, context),
      body: _model.pageWidgets.elementAt(_index.state),
    );
  }
}

class BottomNavigationItems extends HookConsumerWidget {
  const BottomNavigationItems({
    Key? key,
    required this.index,
  }) : super(key: key);
  final StateController<int> index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _l10n = AppLocalizations.of(context);
    // final userSetting = ref.watch(userSettingProvider.notifier);
    // final serverSetting = ref.watch(userSettingServersProvider.notifier);

    // return HookBuilder(builder: (context) {
    return BottomNavigationBar(
      selectedItemColor: kSelectedBottomItemColor,
      unselectedItemColor: kUnselectedBottomItemColor,
      selectedFontSize: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: const Icon(
              Icons.account_box_outlined,
            ),
            activeIcon: const Icon(Icons.account_box),
            label: _l10n?.character ?? ''),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.nat_outlined,
          ),
          activeIcon: const Icon(Icons.nat),
          label: _l10n?.weapon,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.notifications_outlined,
          ),
          activeIcon: const Icon(Icons.notifications),
          label: _l10n?.list,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.settings_outlined,
          ),
          activeIcon: const Icon(Icons.settings),
          label: _l10n?.setting,
        ),
      ],
      currentIndex: index.state,
      onTap: (selectIndex) async {
        if (selectIndex != index.state) {
          final timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
          tz.setLocalLocation(tz.getLocation(timeZoneName));
          ref.refresh(providerGetNotificationList);
        }
        index.state = selectIndex;
      },
    );
    // });
  }
}



  // Widget _buttomNavigator(StateController<int> _index, BuildContext context) {
  //   final _l10n = AppLocalizations.of(context);

  //   // return HookBuilder(builder: (context) {
  //   return BottomNavigationBar(
  //     selectedItemColor: kSelectedBottomItemColor,
  //     unselectedItemColor: kUnselectedBottomItemColor,
  //     showUnselectedLabels: true,
  //     type: BottomNavigationBarType.fixed,
  //     items: <BottomNavigationBarItem>[
  //       const BottomNavigationBarItem(
  //         icon: Icon(Icons.account_box_outlined),
  //         activeIcon: Icon(Icons.account_box),
  //         label: 'Character'
  //         //  _l10n?.home
  //         ,
  //       ),
  //       const BottomNavigationBarItem(
  //         icon: Icon(
  //           Icons.nat_outlined,
  //         ),
  //         activeIcon: Icon(Icons.nat),
  //         label: 'Weapon',
  //       ),
  //       const BottomNavigationBarItem(
  //         icon: Icon(Icons.bug_report_outlined),
  //         activeIcon: Icon(Icons.bug_report),
  //         label: 'dev',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: const Icon(Icons.notifications_outlined),
  //         activeIcon: const Icon(Icons.notifications),
  //         label: _l10n?.list,
  //       ),
  //       BottomNavigationBarItem(
  //         icon: const Icon(Icons.settings_outlined),
  //         activeIcon: const Icon(Icons.settings),
  //         label: _l10n?.setting,
  //       ),
  //     ],
  //     currentIndex: _index.state,
  //     onTap: (selectIndex) async {
  //       final timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  //       final userSetting = useProvider(userSettingProvider.notifier);
  //       final serverSetting = useProvider(userSettingServersProvider.notifier);

  //       tz.setLocalLocation(tz.getLocation(timeZoneName));
  //       userSetting.state = serverSetting.state;
  //       print(userSetting.state);
  //       context.refresh(providerGetNotificationList);

  //       // if (selectIndex == 1) {}
  //       _index.state = selectIndex;
  //     },
  //   );
  //   // });
  // }


