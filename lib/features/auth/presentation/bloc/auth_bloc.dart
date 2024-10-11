import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  final UserSignUp _userSignUp;
  AuthBloc({
    required UserSignUp userSignUp,
}) : _userSignUp = userSignUp ,
        super(AuthInitial()){
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUp(
          UserSignParams(
              email: event.email,
              password: event.password,
              name: event.name
          ),
      );
      res.fold(
            (failure) => emit(AuthFailure(failure.message)),
            (uid) => emit(AuthSuccess(uid)),
      );
    });
  }
}