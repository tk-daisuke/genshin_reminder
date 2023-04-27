import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:genshin_reminder/service/firebase_analytics.dart';
import 'package:genshin_reminder/service/initialize.dart';
import 'package:genshin_reminder/view/character/character_screen.dart';
import 'package:genshin_reminder/view/home/home_screen.dart';
import 'package:genshin_reminder/view/root/root_screen.dart';
import 'package:genshin_reminder/view/setting/setting_screen.dart';
import 'package:genshin_reminder/view/setting_notification/setting_notification_screen.dart';
import 'package:genshin_reminder/view/setting_view/settting_view_screen.dart';
import 'package:genshin_reminder/view/subscribe/subscribe_sceen.dart';
import 'package:genshin_reminder/view/weapon/weapon_screen.dart';
import 'package:genshin_reminder/view/welcome/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

Future<void> main() async {
  final initialize = Initialize();
// arch -x86_64 pod install 
// arch -x86_64 pod repo update
// arch -x86_64 pod install --repo-update
// FlutterアプリからFirebaseエミュレーターに接続
// https://medium.com/flutter-jp/firebase-emulator-938e9a0cdfad
  final logger = SimpleLogger();
  const isEmulator = bool.fromEnvironment('IS_EMULATOR');
  logger.fine('start(isEmulator: $isEmulator)');
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Future.wait([
    initialize.addLicense(),
    initialize.firebaseEmulator(isEmulator: isEmulator),
    initialize.firebaseLoginCheck(),
    initialize.getTimezone(),
    initialize.firebaseCrashlyticsInit(),
    initialize.firebaseAnalyticsInit(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]);
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Genshin Reminder',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF212332),
        textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData(brightness: Brightness.dark).textTheme),

        canvasColor: Colors.grey[800],
        secondaryHeaderColor: Colors.white,
        // accentColor: Colors.cyan[600],
        // Colors.amberAccent
      ),
      navigatorObservers: [
        AnalyticsService.observer,
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // 英語
        Locale('ja', ''), // 日本語
      ],
      initialRoute: RootScreen.id,
      routes: {
        RootScreen.id: (context) => const RootScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        SettingScreen.id: (context) => const SettingScreen(),
        SettingNotificaitonScreen.id: (context) =>
            const SettingNotificaitonScreen(),
        SubscribeScreen.id: (context) => const SubscribeScreen(),
        CharacterScreen.id: (context) => const CharacterScreen(),
        WeaponScreen.id: (context) => const WeaponScreen(),
        SettingViewScreen.id: (context) => const SettingViewScreen(),
      },
    );
  }
}
