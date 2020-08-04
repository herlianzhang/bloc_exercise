import 'package:flutter/material.dart';
import 'package:learn_bloc/bloc/case1/app_init_bloc.dart';
import 'package:learn_bloc/bloc/case1/app_init_event.dart';
import 'package:learn_bloc/bloc/case1/app_init_state.dart';
import 'package:learn_bloc/bloc/helper/bloc_event_state_builder.dart';

class InitializationPage extends StatefulWidget {
  @override
  _InitializationPageState createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  ApplicationInitializationBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ApplicationInitializationBloc();
    bloc.emitEvent(ApplicationInitializationEvent());
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: BlocEventStateBuilder<ApplicationInitializationEvent,
              ApplicationInitializationState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.isInitialized) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushReplacementNamed('/home');
                });
              }
              return Center(
                child: Text('Initilization in progress... ${state.progress}%'),
              );
            },
          ),
        ),
      ),
    );
  }
}
