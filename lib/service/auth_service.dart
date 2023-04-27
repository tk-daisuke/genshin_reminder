import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticatorProvider = StateNotifierProvider<AuthService, User?>(
  (ref) => AuthService(initialUser: FirebaseAuth.instance.currentUser),
);


class AuthService extends StateNotifier<User?> {
  AuthService({User? initialUser}) : super(initialUser) {
    // Userの変更を検知して状態を更新
    _auth.userChanges().listen((user) {
      state = user;
    });
  }
  final _auth = FirebaseAuth.instance;

  User? get firebaseUser => state;
  String? get firebaseUID => state?.uid;

  String? get currentUserUID => _auth.currentUser?.uid;
  Stream<User?> get isAuthStateChanged => _auth.userChanges();
  Future<UserCredential> signUpAnonymously() => _auth.signInAnonymously();

  Future<void>? deleteUser() => state?.delete();
}
