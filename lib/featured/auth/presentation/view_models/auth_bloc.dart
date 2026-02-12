import 'dart:async';
import 'package:astro/core/services/shared_pref/pref_keys.dart';
import 'package:astro/core/services/shared_pref/shared_pref.dart';
import 'package:astro/featured/auth/data/models/login/login_requset.dart';
import 'package:astro/featured/auth/data/models/signUp/sign_up_request.dart';
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
    on<SignUpEvent>(_signUp);

    on<CancelLoadingEvent>((event, emit) {
      emit(const AuthState.failure( errmessage: 'Error in login please make sure you have email ',));
    });

  }

  final formKey = GlobalKey<FormState>();
  final AuthRepos _repos;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  void dispose() {
    email.dispose();
    password.dispose();
  }

  FutureOr<void> _Login(LoginEvent event,
      Emitter<AuthState> emit,) async {
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
        final userToken = LoginData?.data.login
            .accessToken ?? '';
        // save token in sharedPref
        await SharedPref().setString(
          PrefKeys.accessToken, userToken,);
        // get user role
        final user = await _repos.userRole(userToken);
        //get user id and save it in shared pref
        await SharedPref().setInt(
            PrefKeys.userId, user.id ?? 0);
        await SharedPref().setString(
            PrefKeys.userRole, user.userRole ?? '');

        emit(AuthState.success(
            userRole: user.userRole ?? ''));
        debugPrint(result.toString());
      },
      failure: (failure) {

      },
    );
  }


  FutureOr<void> _signUp(SignUpEvent event,
      Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    final result = await _repos.signUp(body: SignUpRequest(
        name: name.text.trim(),
        email: email.text.trim(),
        avatar: event.imageUrl,
        password: password.text.trim()));

    result.when(success: (signup) {
      add(AuthEvent.login());
    }, failure: (error){
      emit(
        AuthState.failure(
          errmessage: error,
        ),
      );
    });
  }
}
