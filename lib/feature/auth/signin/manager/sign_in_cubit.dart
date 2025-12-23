import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/const/cash_keys.dart';
import 'package:food_app/core/helper/cash.dart';
import 'package:food_app/feature/auth/signin/manager/sign_in_state.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_state.dart';
import 'package:food_app/core/models/user_model.dart';

class SignInCubit extends Cubit<SignInState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserModel? currentUser;

  UserModel? get getCurrentUser => currentUser;

  SignInCubit() : super(SignInState());

  //another signin method
  Future<void> signIn() async {
    emit(state.copyWith(status: SignInStatus.loading));
    auth
        .signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        )
        .then((value) async {
          print('User signed in: ${value.user?.email}');

          // Recuperer les informations de l'utilisateur depuis Firestore
          final userDoc = await firestore
              .collection('users')
              .doc(value.user?.uid)
              .get();

          if (userDoc.exists) {
            // final userData = userDoc.data();
            // final userRole = userData?['role'];
            currentUser = UserModel.fromFirestore(userDoc.data()!);

            print('User role from Firestore: ${currentUser!.role.name}');

            emit(
              state.copyWith(
                status: SignInStatus.success,
                userRole: currentUser!.role,
              ),
            );
          } else {
            // Si le document n'existe pas dans Firestore
            emit(
              state.copyWith(
                status: SignInStatus.failure,
                errorMessage: 'User data not found',
              ),
            );
          }
        })
        .catchError((error) {
          print('SignIn error: ${error.toString()}');
          emit(
            state.copyWith(
              status: SignInStatus.failure,
              errorMessage: error.toString(),
            ),
          );
        });
  }

  Future<void> signOut() async {
    await auth.signOut();
    emit(state.copyWith(status: SignInStatus.initial, userRole: null));
    CashHelper.putCash(key: CashKeys.isLogin, value: false);
    currentUser = null;
  }

  // TODO : Méthode pour sign in avec Google
  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: SignInStatus.loading));

    // TODO: Implémenter la logique Google Sign-In
    // Utilisez firebase_auth et google_sign_in packages

    // Exemple:
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );
    // await auth.signInWithCredential(credential);

    emit(state.copyWith(status: SignInStatus.success));
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
