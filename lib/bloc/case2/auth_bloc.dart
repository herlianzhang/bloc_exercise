import 'package:learn_bloc/bloc/case2/auth_event.dart';
import 'package:learn_bloc/bloc/case2/auth_state.dart';

import '../helper/bloc_event_state.dart';

class AuthenticationBloc
    extends BlocEventStateBase<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          initialState: AuthenticationState.notAuthenticated(),
        );

  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    if (event is AuthenticationEventLogin) {
      yield AuthenticationState.authenticating();

      await Future.delayed(const Duration(seconds: 2));

      if (event.name == 'failure')
        yield AuthenticationState.failure();
      else
        yield AuthenticationState.authenticated(event.name);
    }

    if (event is AuthenticationEventLogout)
      yield AuthenticationState.notAuthenticated();
  }
}
