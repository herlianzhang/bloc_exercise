import 'dart:async';

const String _kEmailRule = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";

class EmailValidator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
  final emailExp = RegExp(_kEmailRule);

    if (!emailExp.hasMatch(email) || email.isEmpty)
      sink.addError('Entre a valid email');
    else
      sink.add(email);
  });
}
