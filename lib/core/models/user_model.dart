import 'package:food_app/feature/auth/signup/manager/sign_up_state.dart';

class UserModel {
  //final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final int age;
  final UserRole role;
  final DateTime createdAt;
  final String? password; 

  UserModel({
    //required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.age,
    required this.role,
    required this.createdAt,
    required this.password,
  });

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    UserRole userRole = UserRole.USER;
    final roleString = data['role']?.toString().toUpperCase();
    
    if (roleString == 'ADMIN') {
      userRole = UserRole.ADMIN;
    } else if (roleString == 'USER') {
      userRole = UserRole.USER;
    }

    return UserModel(
      //uid: id,
      email: data['email'] ?? '',
      firstName: data['firstName'] ?? '',
      lastName: data['lastName'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      age: (data['age'] is int) ? data['age'] : int.tryParse(data['age']?.toString() ?? '0') ?? 0,
      role: userRole,
      createdAt: data['createdAt'] != null 
          ? DateTime.parse(data['createdAt'])
          : DateTime.now(), 
      password: data['password'] ?? '',
    );
  }

  // Convertir en Map pour Firestore
  Map<String, dynamic> toFirestore() {
    return {
      //'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'age': age,
      'role': role.name, 
      'createdAt': createdAt.toIso8601String(),
      'password': password,
    };
  }

  UserModel copyWith({
    //String? uid,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    int? age,
    UserRole? role,
    DateTime? createdAt,
    String? password,
  }) {
    return UserModel(
      //uid: uid ?? this.uid,
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      age: age ?? this.age,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(email: $email, firstName: $firstName, lastName: $lastName, role: ${role.name})';
  }

  bool get isAdmin => role == UserRole.ADMIN;
  bool get isUser => role == UserRole.USER;
  
  String get fullName => '$firstName $lastName';
}