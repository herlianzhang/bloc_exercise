import 'package:learn_bloc/bloc/app_init_event.dart';
import 'package:learn_bloc/bloc/app_init_state.dart';
import 'package:learn_bloc/bloc/helper/bloc_event_state.dart';

class ApplicationInitializationBloc extends BlocEventStateBase<
    ApplicationInitializationEvent, ApplicationInitializationState> {
  ApplicationInitializationBloc()
      : super(initialState: ApplicationInitializationState.notInitilized());

  @override
  Stream<ApplicationInitializationState> eventHandler(ApplicationInitializationEvent event, ApplicationInitializationState currentState) async* {
    if (!currentState.isInitializing) {
      yield ApplicationInitializationState.notInitilized();
    }

    if (event.type == ApplicationInitializationEventType.start) {
      for(int progress = 0; progress < 101; progress++) {
        await Future.delayed(const Duration(milliseconds: 250));
        yield ApplicationInitializationState.progressing(progress);
      }
    }

    if (event.type == ApplicationInitializationEventType.stop) {
      yield ApplicationInitializationState.initialized();
    }
  }
}
