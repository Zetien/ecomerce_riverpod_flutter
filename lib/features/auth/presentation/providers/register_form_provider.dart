import 'package:flutter_riverpod/legacy.dart';
import 'package:formz/formz.dart';
import 'package:teslo_app_z/features/shared/infraestructure/inputs/confirm_password.dart';
import 'package:teslo_app_z/features/shared/infraestructure/inputs/email.dart';
import 'package:teslo_app_z/features/shared/infraestructure/inputs/name.dart';
import 'package:teslo_app_z/features/shared/infraestructure/inputs/password.dart';

class RegisterFormState {
  final Name name;
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final bool isValid;
  final bool isFormPosted;

  RegisterFormState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.isValid = false,
    this.isFormPosted = false,
  });

  RegisterFormState copyWith({
    Name? name,
    Email? email,
    Password? password,
    ConfirmPassword? confirmPassword,
    bool? isValid,
    bool? isFormPosted,
  }) => RegisterFormState(
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    isValid: isValid ?? this.isValid,
    isFormPosted: isFormPosted ?? this.isFormPosted,
  );

  @override
  String toString() {
    return '''  RegisterFormState:
      name: $name, 
      email: $email, 
      password: $password, 
      confirmPassword: $confirmPassword, 
      isValid: $isValid,
      isFormPosted: $isFormPosted
''';
  }
}

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  RegisterFormNotifier() : super(RegisterFormState());

  void onNameChanged(String value) {
    final newName = Name.dirty(value);

    state = state.copyWith(
      name: newName,
      isValid: Formz.validate([
        newName,
        state.email,
        state.password,
        state.confirmPassword,
      ]),
    );
  }

  void onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }

  void onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);

    final newConfirmPassword = ConfirmPassword.dirty(
      state.confirmPassword.value,
      originalPassword: value,
    );

    state = state.copyWith(
      password: newPassword,
      confirmPassword: newConfirmPassword,
      isValid: Formz.validate([state.email, newPassword, newConfirmPassword]),
    );
  }

  void onConfirmPasswordChanged(String value) {
    final newConfirmPassword = ConfirmPassword.dirty(
      value,
      originalPassword: state.password.value,
    );

    state = state.copyWith(
      confirmPassword: newConfirmPassword,
      isValid: Formz.validate([
        state.email,
        state.password,
        newConfirmPassword,
      ]),
    );
  }

  void onFormSubmit() {
    _touchEveryField();
    if (!state.isValid) return;
    print(state);
  }

  void _touchEveryField() {
    final name = Name.dirty(state.name.value);
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final confirmPassword = ConfirmPassword.dirty(
      state.confirmPassword.value,
      originalPassword: state.password.value,
    );

    state = state.copyWith(
      isFormPosted: true,
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      isValid: Formz.validate([name, email, password, confirmPassword]),
    );
  }
}

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>((
      ref,
    ) {
      return RegisterFormNotifier();
    });
