import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SupabaseClient supabase = Supabase.instance.client;
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>(_authLoginEvent);

    on<VerifyOtpEvent>(_authVerifyOtpEvent);

    on<AuthLogOutEvent>(_authLogOutEvent);
  }

  _authLoginEvent(AuthLoginEvent event, Emitter<AuthState> emit) async {
    print("Login called");
    //login feature. send otp to mail.

    await supabase.auth.signInWithOtp(
      email: event.email,
    );
    emit(
      // AuthSuccessState(
      //   message: "res.user.toString()",
      //   uid: event.email + event.name + event.phone,
      // ),
      AuthOtpSentState(),
    );
    return;
  }

  _authVerifyOtpEvent(VerifyOtpEvent event, Emitter<AuthState> emit) async {
    final res = await supabase.auth
        .verifyOTP(type: OtpType.email, email: event.email, token: event.otp);

    if (res.user != null) {
      emit(
        AuthSuccessState(
          message: (res.session ?? "").toString(),
          uid: res.user!.id,
        ),
      );
    }
  }

  _authLogOutEvent(AuthLogOutEvent event, Emitter<AuthState> emit) async {
    await supabase.auth.signOut();
    emit(AuthInitial());
  }
}
