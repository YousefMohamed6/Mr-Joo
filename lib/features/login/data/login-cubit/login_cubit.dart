import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mrjoo/core/utils/constants/text.dart';
import 'package:mrjoo/features/chat/data/model/user_model.dart';
import 'package:mrjoo/features/login/data/login-cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit() : super(LoginInitial());
  var email = TextEditingController();
  var password = TextEditingController();
  var emailkey = GlobalKey<FormState>();
  var passwordKey = GlobalKey<FormState>();
  bool obscuretext = true;

  void changeObscureText() {
    obscuretext = !obscuretext;
    emit(LoginInitial());
  }

  Future<void> loginUser() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      var userBox = Hive.box<UserModel>(kUserBox);
      var user = UserModel(
        userId: FirebaseAuth.instance.currentUser!.uid,
        userName: FirebaseAuth.instance.currentUser!.displayName!,
      );
      await userBox.add(user);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      emit(LoginFialure(errMessage: e.code));
    }
  }

  Future<void> sendRestPasswordLink() async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email.text,
      );
      emit(RestSuccess());
    } on Exception {
      emit(LoginFialure(errMessage: 'Invalid Email'));
    }
  }
}
