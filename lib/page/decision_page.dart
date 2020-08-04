import 'package:flutter/material.dart';

import 'package:learn_bloc/bloc/case2/auth_bloc.dart';
import 'package:learn_bloc/bloc/case2/auth_event.dart';
import 'package:learn_bloc/bloc/case2/auth_state.dart';
import 'package:learn_bloc/page/auth_page.dart';

import '../bloc/helper/bloc_event_state_builder.dart';
import '../bloc/helper/bloc_provider.dart';
import '../main.dart';

class DecisionPage extends StatefulWidget {
  @override
  _DecisionPageState createState() => _DecisionPageState();
}

class _DecisionPageState extends State<DecisionPage> {
  AuthenticationState oldAuthenticationState;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocEventStateBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: bloc,
      builder: (context, state) {
        if (state != oldAuthenticationState) oldAuthenticationState = state;

        if (state.isAuthenticated)
          _redirectToPage(context, MyHomePage());
        else if (state.isAuthenticating || state.hasFailed) {
        } else
          _redirectToPage(context, AuthenticationPage());

        return Container();
      },
    );
  }

  void _redirectToPage(BuildContext context, Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var newRoute = MaterialPageRoute(
        builder: (context) => page,
      );

      Navigator.of(context)
          .pushAndRemoveUntil(newRoute, ModalRoute.withName('/decision'));
    });
  }
}
