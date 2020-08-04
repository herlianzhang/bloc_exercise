import 'package:flutter/material.dart';

import 'package:learn_bloc/bloc/case2/auth_bloc.dart';
import 'package:learn_bloc/bloc/case2/auth_event.dart';
import 'package:learn_bloc/bloc/case2/auth_state.dart';
import 'package:learn_bloc/page/log_out_button.dart';
import '../bloc/helper/bloc_event_state_builder.dart';
import '../bloc/helper/bloc_provider.dart';

class AuthenticationPage extends StatelessWidget {
  Future<bool> _onWillPopScope() async => false;

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Authentication Page'),
            actions: <Widget>[
              LogOutButton(),
            ],
          ),
          body: Container(
            child:
                BlocEventStateBuilder<AuthenticationEvent, AuthenticationState>(
              bloc: bloc,
              builder: (context, state) {
                if (state.isAuthenticating)
                  return Center(
                    child: CircularProgressIndicator(),
                  );

                if (state.isAuthenticated) return Container();

                return Column(
                  children: <Widget>[
                    ListTile(
                      title: RaisedButton(
                        child: Text('Log in (Success)'),
                        onPressed: () {
                          bloc.emitEvent(
                              AuthenticationEventLogin(name: 'Didier'));
                        },
                      ),
                    ),
                    ListTile(
                      title: RaisedButton(
                        child: Text('Log in (failure)'),
                        onPressed: () {
                          bloc.emitEvent(
                              AuthenticationEventLogin(name: 'failure'));
                        },
                      ),
                    ),
                    if (state.hasFailed) Text('Authentication failure!'),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
