import 'package:learn_bloc/bloc/case2/bloc_email_validator.dart';
import 'package:learn_bloc/bloc/case2/bloc_password_validator.dart';
import 'package:learn_bloc/bloc/helper/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class RegistrationFormBloc extends Object
    with EmailValidator, PasswordValidator
    implements BlocBase {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmController = BehaviorSubject<String>();

  // input
  Function(String) get onEmailChanged => _emailController.sink.add;

  Function(String) get onPasswordChanged => _passwordController.sink.add;

  Function(String) get onRetypePasswordChanged =>
      _passwordConfirmController.sink.add;

  // validators
  Stream<String> get email => _emailController.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<String> get confirmPassword => _passwordConfirmController.stream
          .transform(validatePassword)
          .doOnData((event) {
        if (0 != _passwordController.value.compareTo(event)) {
          _passwordController.addError('No Match');
        }
      });

  // registration button
  Stream<bool> get registerValid => Rx.combineLatest3(
      email, password, confirmPassword, (e, p, c) => (0 == p.compareTo(c)));

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _passwordConfirmController?.close();
  }
}
