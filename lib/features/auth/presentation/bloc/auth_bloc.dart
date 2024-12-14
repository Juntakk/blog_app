import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/useCase/usecase.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_login.dart';
import 'package:blog_app/features/auth/domain/usecases/user_logout.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/core/utils/is_valid_email.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final LogoutUserUseCase _logoutUserUseCase;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required UserSignUp userSignUp,
    required UserLogin userLogin,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
    required LogoutUserUseCase logoutUserUseCase,
  })  : _userSignUp = userSignUp,
        _userLogin = userLogin,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        _logoutUserUseCase = logoutUserUseCase,
        super(
          AuthInitial(),
        ) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
    on<LogoutEvent>(_onLogoutEvent);
  }

  Future<void> _onLogoutEvent(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    serviceLocator<AppUserCubit>().loggedOut();

    final result = await _logoutUserUseCase(NoParams());
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(AuthLoggedOut()),
    );
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final result = await _currentUser(NoParams());

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    if (event.password.length < 6 && !isValidEmail(event.email)) {
      emit(const AuthFailure("Mistakes were Made"));
      return;
    }
    if (!isValidEmail(event.email)) {
      emit(const AuthFailure("Invalid email"));
      return;
    }
    if (event.password.length < 6) {
      emit(const AuthFailure("Password needs at least 8 characters"));
      return;
    }

    try {
      final response = await _userSignUp(
        UserSignUpParams(
          email: event.email,
          name: event.name,
          password: event.password,
        ),
      );
      response.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (user) => _emitAuthSuccess(user, emit),
      );
    } on ServerException catch (e) {
      if (e.toString().contains('User')) {
        emit(const AuthFailure('Email is already taken'));
      } else {
        emit(AuthFailure("An error occurred: ${e.toString()}"));
      }
    }
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    final response = await _userLogin(
      UserLoginParams(
        email: event.email,
        password: event.password,
      ),
    );
    response.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
