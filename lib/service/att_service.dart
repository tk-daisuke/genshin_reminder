import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 勝手にiOS判定してくれる
final attProvider = FutureProvider<TrackingStatus>((ref) async {
  //ATT設定取得
  final status = await AppTrackingTransparency.trackingAuthorizationStatus;
  //ATTが設定されていない場合実行
  if (status == TrackingStatus.notDetermined) {
    await Future.delayed(
      const Duration(milliseconds: 200),
    );
    //ダイアログ表示
    final dialog = await AppTrackingTransparency.requestTrackingAuthorization();
    return dialog;
  } else {
    return status;
  }
});

class AttService {}
