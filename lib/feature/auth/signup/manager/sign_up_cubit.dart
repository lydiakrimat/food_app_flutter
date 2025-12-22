import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {

  SignUpCubit() : super(SignUpState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void toggleRestaurantManager(bool isManager) {
    final newRole = isManager ? UserRole.ADMIN : UserRole.USER;
    emit(state.copyWith(userRole: newRole));
  }
   Future<void> signUp() async {
    emit(state.copyWith(status: SignUpStatus.loading));
    auth
        .createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text)
        .then((value) {
          firestore.collection('users').doc(value.user?.uid).set({
            'firstName': firstNameController.text,
            'lastName': lastNameController.text,
            'email': emailController.text,
            'phoneNumber': phoneNumberController.text,
            'age': int.parse(ageController.text),
            'role': state.userRole.toString().split('.').last, 
            'uid': value.user?.uid,
            'createdAt': DateTime.now().toIso8601String(),
            //'createdAt': FieldValue.serverTimestamp(),
          });

          print('User created: ${value.user?.email}');
          print('User role: ${state.userRole.name}');
          emit(state.copyWith(status: SignUpStatus.success));
        })
        .catchError((error) {
          print('SignUp error: ${error.toString()}');
          emit(
            state.copyWith(
              status: SignUpStatus.failure,
              errorMessage: error.toString(),
            ),
          );
        });
  }


  // Future<void> signUp({
  //   required String email,
  //   required String password,
  //   required String firstName,
  //   required String lastName,
  //   required String phoneNumber,
  //   required String age,
  //   required UserRole role,
  // }) async {
  //   emit(state.copyWith(status: SignUpStatus.loading));
  //   auth
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((value) {
  //         firestore.collection('users').doc(value.user?.uid).set({
  //           'firstName': firstName,
  //           'lastName': lastName,
  //           'email': email,
  //           'phoneNumber': phoneNumber,
  //           'age': age,
  //           'role': role.toString().split('.').last, 
  //           'uid': value.user?.uid,
  //           'createdAt': DateTime.now().toIso8601String(),
  //           //'createdAt': FieldValue.serverTimestamp(),
  //         });

  //         print('User created: ${value.user?.email}');
  //         print('User role: ${role.name}');
  //         emit(state.copyWith(status: SignUpStatus.success));
  //       })
  //       .catchError((error) {
  //         print('SignUp error: ${error.toString()}');
  //         emit(
  //           state.copyWith(
  //             status: SignUpStatus.failure,
  //             errorMessage: error.toString(),
  //           ),
  //         );
  //       });
  // }

  void setUserRole(UserRole role) {
    emit(state.copyWith(userRole: role));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    ageController.dispose();
    return super.close();
  }
}
