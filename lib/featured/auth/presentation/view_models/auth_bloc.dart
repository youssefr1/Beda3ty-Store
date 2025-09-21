import 'dart:async';
import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:astro/featured/auth/data/models/login_requset.dart';
import 'package:astro/featured/auth/data/repos/auth_repos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_bloc.freezed.dart'; //مهمه
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repos) : super(const _Initial()) {
    on<LoginEvent>(_Login);
  }

  final AuthRepos _repos;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FutureOr<void> _Login(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final result = await _repos.login(
      body: LoginRequset(
        email: email.text.trim(),
        password: password.text,
      ),
    );

    await result.when(
      success: (LoginData) async {
        // user Token
        final userToken = LoginData.dataModel.loginModel.accessToken ?? '';
        // save token in sharedPref
        await SharedPref().setString(PrefKeys.accessToken, userToken,);
        // get user role
       final user= await _repos.userRole(userToken);
       //get user id and save it in shared pref
       await SharedPref().setInt(PrefKeys.userId, user.id ?? 0);

        emit( AuthState.success(userRole: user.userRole ?? ''));
      },
      failure: (failure) {
        emit(
          AuthState.failure(
            errmessage: failure,
          ),
        );
      },
    );
  }
}
