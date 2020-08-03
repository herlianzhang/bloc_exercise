import 'bloc_provider.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class BlocEvent extends Object {}
abstract class BlocState extends Object {}

abstract class BlocEventStateBase<BlocEvent, BlocState> implements BlocBase {
  var _eventController = PublishSubject<BlocEvent>();
  var _stateController = BehaviorSubject<BlocState>();

  Function(BlocEvent) get emitEvent => _eventController.sink.add;
  Stream<BlocState> get state => _stateController.stream;

  Stream<BlocState> eventHandler(BlocEvent event, BlocState currentState);

  final BlocState initialState;

  BlocEventStateBase({@required this.initialState}) {
    _eventController.listen((event) {
      var currentState = _stateController.value ?? initialState;
      eventHandler(event, currentState).forEach((newState) {
        _stateController.sink.add(newState);
      });
    });
  }

  @override
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}