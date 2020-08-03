import 'package:learn_bloc/bloc/helper/bloc_event_state.dart';

class ApplicationInitializationEvent extends BlocEvent {
  final ApplicationInitializationEventType type;

  ApplicationInitializationEvent({
    this.type: ApplicationInitializationEventType.start,
  }) : assert(type != null);
}

enum ApplicationInitializationEventType {
  start,
  stop,
}
