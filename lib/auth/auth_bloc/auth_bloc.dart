import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/appwrite_account.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final Account account = AppwriteAccount.getAccount;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>(_authLoginEvent);

    on<VerifyOtpEvent>(_authVerifyOtpEvent);

    on<AuthLogOutEvent>(_authLogOutEvent);
  }

  void _authLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) async {
    print("Login called");
    final sessionToken = await account.createEmailToken(
      email: event.email,
      userId: ID.unique(),
    );

    final userId = sessionToken.userId;
    print("session tocken : $sessionToken");
    print("userId : $userId");

    emit(
      AuthOtpSentState(userId: userId),
    );
    return;
  }

  void _authVerifyOtpEvent(
      VerifyOtpEvent event, Emitter<AuthState> emit) async {
    try {
      final Session session = await account.createSession(
        userId: event.userId,
        secret: event.otp,
      );
      print("object");
      print(event.email);
      emit(
        AuthSuccessState(message: session.secret, uid: session.userId),
      );
    } catch (e) {
      print(e.toString());
      emit(
        AuthErrorState(
          errorMessage: "Error occured : ${e.toString()}",
        ),
      );
    }
  }

  void _authLogOutEvent(AuthLogOutEvent event, Emitter<AuthState> emit) async {
    await account.deleteSession(sessionId: 'current');
    emit(AuthInitial());
  }
}
