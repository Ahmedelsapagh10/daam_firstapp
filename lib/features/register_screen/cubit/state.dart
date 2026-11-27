abstract class RegisterState {}

class InitialRegisterState extends RegisterState {}

class RegisterValidationState extends RegisterState {
  RegisterValidationState(this.isValid);

  final bool isValid;
}
