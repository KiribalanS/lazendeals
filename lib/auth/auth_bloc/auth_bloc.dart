import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazendeals/appwrite_account.dart';
import 'package:lazendeals/local_storage/store_prefs.dart/user_preferences.dart';
import 'package:lazendeals/models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Account account = AppwriteAccount.getAccount;
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

      final userData = await account.get();
      userModel.userId = session.$id;
      userModel.mail = userData.email;
      userModel.name = userData.name;
      // userModel.gender =
      //     userData.prefs.data["gender"] == "male" ? Gender.male : Gender.female;
      // userModel.address = userData.prefs.data["address"];
      // userModel.phone = userData.prefs.data["phone"];
      // userModel.pincode = userData.prefs.data["pincode"];
      UserPreferences.setPreferences("user", userModel);
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
