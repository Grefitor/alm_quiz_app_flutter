import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_alm_quiz/notificaiton_service.dart';
import 'package:flutter_alm_quiz/repositories/auth_repo_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';


part 'authentication_state.dart';

final authProvider = StateNotifierProvider<AuthController, AuthenticationState>(
      (ref) => AuthController(ref.watch(authRepoProvider)),
);

class AuthController extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authRepository;
  late final StreamSubscription _streamSubscription;

  AuthController(this._authRepository)
      : super(const AuthenticationState.unauthenticated()) {
    _streamSubscription =
        _authRepository.user.listen((user) => _onUserChanged(user));
  }

  void _onUserChanged(AuthUser user) {
    if (user.isEmpty) {
      state = const AuthenticationState.unauthenticated();
    } else {
      state = AuthenticationState.authenticated(user);
    }
  }

  void onSignOut() {
    final NotificaitonService notificationService = NotificaitonService();
    notificationService.resetAll();
    _authRepository.signOut();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}