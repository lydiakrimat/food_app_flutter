enum SignUpStatus { initial, loading, success, failure }

enum UserRole { USER, ADMIN }

class SignUpState {
  final SignUpStatus status;
  final UserRole userRole;
  final String? errorMessage;

  SignUpState({
    this.status = SignUpStatus.initial,
    this.userRole = UserRole.USER,
    this.errorMessage,
  });
  SignUpState copyWith({
    SignUpStatus? status,
    UserRole? userRole,
    String? errorMessage,
  }) {
    return SignUpState(
      status: status ?? this.status,
      userRole: userRole ?? this.userRole,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  String toString() =>
      'SignUpState{status: $status, userRole: $userRole, errorMessage: $errorMessage}';
}
