part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String name;
  final String email;
  final String phone;

  AuthLoginEvent(
      {required this.name, required this.email, required this.phone});
}

class AuthLogOutEvent extends AuthEvent {
  final BuildContext context;

  AuthLogOutEvent({required this.context});
}

class VerifyOtpEvent extends AuthEvent {
  final String email;
  final String userId;
  final String otp;

  VerifyOtpEvent(
      {required this.otp, required this.email, required this.userId});
}
