import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

final account = Account(
  Client()
      .setEndpoint('http://192.168.0.138:90/v1')
      .setProject('67a2eed900152c3e373b')
      .setSelfSigned(status: true),
);

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>(_authLoginEvent);

    on<VerifyOtpEvent>(_authVerifyOtpEvent);

    on<AuthLogOutEvent>(_authLogOutEvent);
  }

  _authLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) async {
    print("Login called");
    //login feature. send otp to mail.

    final sessionToken = await account.createEmailToken(
      email: event.email,
      userId: ID.unique(),
    );

    final userId = sessionToken.userId;
    print("session tocken : $sessionToken");
    print("userId : $userId");
    // final user = await account.get();
    emit(
      // AuthSuccessState(
      //   message: "res.user.toString()",
      //   uid: event.email + event.name + event.phone,
      // ),
      AuthOtpSentState(userId: userId),
    );
    return;
  }

  _authVerifyOtpEvent(VerifyOtpEvent event, Emitter<AuthState> emit) async {
    // final res = await supabase.auth
    //     .verifyOTP(type: OtpType.email, email: event.email, token: event.otp);

    // if (res.user != null) {
    //   emit(
    //     AuthSuccessState(
    //       message: (res.session ?? "").toString(),
    //       uid: res.user!.id,
    //     ),
    //   );
    // }
    try {
      final session = await account.createSession(
        userId: event.userId,
        secret: event.otp,
      );
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

  _authLogOutEvent(AuthLogOutEvent event, Emitter<AuthState> emit) async {
    await account.deleteSession(sessionId: 'current');
    emit(AuthInitial());
  }
}


  // Future<void> login(String email, String password) async {
  //   await widget.account.createEmailPasswordSession(email: email, password: password);
  //   final user = await widget.account.get();
  //   setState(() {
  //     loggedInUser = user;
  //   });
  // }

  // Future<void> register(String email, String password, String name) async {
  //   await widget.account.create(
  //       userId: ID.unique(), email: email, password: password, name: name);
  //   await login(email, password);
  // }

  // Future<void> logout() async {
  //   await widget.account.deleteSession(sessionId: 'current');
  //   setState(() {
  //     loggedInUser = null;
  //   });
  // }