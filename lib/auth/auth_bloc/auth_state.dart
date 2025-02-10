part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthSuccessState extends AuthState {
  final String message;
  final String uid;

  AuthSuccessState({required this.message, required this.uid});
}

class AuthFailureState extends AuthState {
  final String failureMessage;

  AuthFailureState({required this.failureMessage});
}

class AuthOtpSentState extends AuthState {
  final String userId;

  AuthOtpSentState({required this.userId});
}

class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
}
