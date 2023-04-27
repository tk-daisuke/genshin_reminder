import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorService {
  String errorMessageSnackBar(String e, BuildContext context) {
    final errorText = firebaseErrorSelector(e, context);
    final snackBar = SnackBar(content: Text(errorText));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return errorText;
  }

  String firebaseErrorSelector(String e, BuildContext context) {
    final _l10n = AppLocalizations.of(context);
    var _infoText = '';
    switch (e) {
      case 'requires-recent-login':
        _infoText = e;
        // 'この操作をするには再認証が必要です';
        break;
      case 'missing-email':
        _infoText = e;
        //  'メールアドレスに問題があります';
        break;
      case 'email-already-in-use':
        _infoText = e;
        //  'そのメールアドレスは既に存在します';
        break;
      case 'sign_in_canceled':
        _infoText = _l10n!.sign_in_canceled;
        break;
      case 'error-invalid-email':
        _infoText = e;
        // 'メールアドレスの形式が間違っています';
        break;
      case 'user-not-found':
        _infoText = e;
        // 'そのアカウントは存在しません';
        break;
      case 'network-request-failed':
        _infoText = _l10n!.network_request_failed;
        break;
      case 'too-many-requests': //異常なアクティビティが原因
        _infoText = _l10n!.too_many_requests;
        break;
      case 'credential-already-in-use':
        _infoText = e;
        // 'この資格情報は、すでに別のユーザーアカウントに関連付けられています。';
        break;
      default:
        _infoText = _l10n!.too_many_requests;
    }
    return _infoText;
  }
}
