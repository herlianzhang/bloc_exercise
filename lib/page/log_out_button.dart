import 'package:flutter/material.dart';
import 'package:learn_bloc/bloc/case2/auth_bloc.dart';
import 'package:learn_bloc/bloc/case2/auth_event.dart';

import '../bloc/helper/bloc_provider.dart';

class LogOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthenticationBloc>(context);
    return IconButton(
      icon: Icon(Icons.exit_to_app),
      onPressed: () => bloc.emitEvent(AuthenticationEventLogout()),
    );
  }
}
