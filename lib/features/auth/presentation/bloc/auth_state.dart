part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoggedOut extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess(this.user);
}

final class AuthSuccessMessage extends AuthState {
  final String message;
  const AuthSuccessMessage(this.message);
}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}
