import 'package:formz/formz.dart';

enum NameError { empty }

class Name extends FormzInput<String, NameError> {

  const Name.pure() : super.pure('');
  const Name.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NameError.empty) {
      return 'El nombre es obligatorio';
    }

    return null;
  }

  @override
  NameError? validator(String value) {
    if (value.trim().isEmpty) return NameError.empty;

    return null;
  }
}