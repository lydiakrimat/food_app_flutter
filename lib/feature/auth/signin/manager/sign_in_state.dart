import 'package:food_app/feature/auth/signup/manager/sign_up_state.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState {
  final SignInStatus status;
  final String? errorMessage;
  final UserRole? userRole; // Optionnel: pour connaître le rôle après connexion

  SignInState({
    this.status = SignInStatus.initial,
    this.errorMessage,
    this.userRole,
  });

  SignInState copyWith({
    SignInStatus? status,
    String? errorMessage,
    UserRole? userRole,
  }) {
    return SignInState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      userRole: userRole ?? this.userRole,
    );
  }

  @override
  String toString() =>
      'SignInState{status: $status, errorMessage: $errorMessage, userRole: $userRole}';
}