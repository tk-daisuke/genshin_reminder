import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genshin_reminder/item/server_time.dart';
import 'package:genshin_reminder/item/user_settings.dart';
import 'package:genshin_reminder/service/auth_service.dart';
import 'package:genshin_reminder/service/error_service.dart';
import 'package:genshin_reminder/service/firestore_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingNotificationProvider =
    ChangeNotifierProvider<SettingNotificationModel>((ref) => SettingNotificationModel());
final timezoneSelectIndex = StateProvider<int>((ref) => 3);

class SettingNotificationModel extends ChangeNotifier {
  // final times = List<int>.generate(24, (index) => index);
  // final timesString = List<String>.generate(24, (index) => '$index');
  // final minutes = <int>[0, 15, 30, 45];
  final timezone = [
    ServerTime.asia,
    ServerTime.na,
    ServerTime.eu,
    ServerTime.local
  ];
  final _auth = AuthService();
  final _firestore = FirestoreService();

  Future<void> updateSetting(
      {required StateController<UserSettings> userSetting,
      required StateController<UserSettings> serverSetting,
      required BuildContext context}) async {
    final _uid = _auth.firebaseUID!;
    try {
      await _firestore.saveSetting(
        uid: _uid,
        settings: userSetting.state,
      );
      await getSetting(
          userSetting: userSetting,
          serverSetting: serverSetting,
          context: context);
    } on FirebaseException catch (e) {
      ErrorService().errorMessageSnackBar(e.code, context);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> getSetting(
      {required StateController<UserSettings> userSetting,
      required StateController<UserSettings> serverSetting,
      required BuildContext context}) async {
    final _uid = _auth.firebaseUID;
    final errorService = ErrorService();

    if (_uid != null) {
      try {
        final setting = await _firestore.getSetting(uid: _uid);
        userSetting.state = setting;
        serverSetting.state = setting;
      } on FirebaseException catch (e) {
        errorService.errorMessageSnackBar(e.code, context);
        notifyListeners();
      }
    }
  }
  // void cupertinoPicker(context) {
  //   showCupertinoModalPopup(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           //Pickerの高さを指定。指定しない場合はフルスクリーン。
  //           height: 250,
  //           color: Colors.white,
  //           child: Column(
  //             children: [
  //               TextButton(
  //                 child: const Text('閉じる'),
  //                 onPressed: () => Navigator.of(context).pop(),
  //               ),
  //               const Divider(),
  //               Expanded(
  //                 child: Row(
  //                   children: [
  //                     Expanded(
  //                       child: CupertinoPicker(
  //                         // ループさせるかどうか
  //                         looping: true, diameterRatio: 1.0,

  //                         // Pickerのそれぞれの高さ
  //                         itemExtent: 30,
  //                         //先程作成したnumbarsリストをText Widgetに変換して読み込み。
  //                         children: times
  //                             .map(
  //                               (e) => Text('$e'),
  //                             )
  //                             .toList(),
  //                         //Pickerの操作を行う度に呼び出し。
  //                         //selectNumbarに選択したnumbarsを代入。
  //                         onSelectedItemChanged: (index) {
  //                           print(index);
  //                         },
  //                       ),
  //                     ),
  //                     Expanded(
  //                       child: CupertinoPicker(
  //                         // ループさせるかどうか
  //                         looping: true,
  //                         // Pickerのそれぞれの高さ
  //                         itemExtent: 30,
  //                         //先程作成したnumbarsリストをText Widgetに変換して読み込み。
  //                         children: minutes
  //                             .map(
  //                               (e) => Text('$e'),
  //                             )
  //                             .toList(),
  //                         //Pickerの操作を行う度に呼び出し。
  //                         //selectNumbarに選択したnumbarsを代入。
  //                         onSelectedItemChanged: (index) {
  //                           print(index);
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       });
  // }
}
