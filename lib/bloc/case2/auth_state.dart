import 'package:flutter/foundation.dart';
import '../helper/bloc_event_state.dart';

class AuthenticationState extends BlocState {
  AuthenticationState({
    @required this.isAuthenticated,
    this.isAuthenticating: false,
    this.hasFailed: false,
    this.name: '',
  });

  final bool isAuthenticated;
  final bool isAuthenticating;
  final bool hasFailed;

  final String name;

  factory AuthenticationState.notAuthenticated() =>
      AuthenticationState(isAuthenticated: false);

  factory AuthenticationState.authenticated(String name) => AuthenticationState(
        isAuthenticated: true,
        name: name,
      );

  factory AuthenticationState.authenticating() => AuthenticationState(
        isAuthenticated: false,
        isAuthenticating: true,
      );

  factory AuthenticationState.failure() => AuthenticationState(
        isAuthenticated: false,
        hasFailed: true,
      );
}
