import 'dart:async';

class PasswordValidator {
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        if (password.length < 4) sink.addError('Password not valid');
        else sink.add(password);
      });
}
