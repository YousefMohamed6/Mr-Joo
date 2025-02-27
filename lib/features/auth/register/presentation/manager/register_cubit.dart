import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrjoo/core/services/show_message.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final displyName = TextEditingController();
  bool _obscuretext = true;
  final bool _isLoading = false;
  String language = 'en';
  bool isAccept = true;

  void changeAccpetTremsAndPrivacy() {
    isAccept = !isAccept;
    emit(RegisterInitial());
  }

  void changeLanguage({required String language}) {
    this.language = language;
    emit(RegisterInitial());
  }

  void changeObscureText() {
    _obscuretext = !_obscuretext;
    emit(RegisterInitial());
  }

  Future<void> _signInWithGoogleMobile() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await GoogleSignIn().signOut();
      emit(Success());
    } catch (ex) {
      emit(Failure());
    }
  }

  Future<void> singInWithGoogle(context) async {
    if (isAccept) {
      try {
        emit(Loading());
        Platform.isAndroid || Platform.isIOS
            ? _signInWithGoogleMobile()
            : _signInWithGoogleWeb();
      } on Exception {
        emit(Failure());
      }
    } else {
      ShowMessage.show(context, msg: 'Please Accept Trems & Policy');
    }
  }

  bool get obscuretext => _obscuretext;
  bool get isLoading => _isLoading;

  void register() async {
    if (isAccept) {
      emit(Loading());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        FirebaseAuth.instance.currentUser!.updateDisplayName(displyName.text);
        emit(Success());
      } on FirebaseAuthException catch (ex) {
        emit(RegisterFailure(errMessage: ex.code));
      }
    } else {
      emit(NotAcceptTermsAndPolicy());
    }
  }

  Future<void> _signInWithGoogleWeb() async {
    try {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
      await FirebaseAuth.instance.signInWithPopup(googleProvider);
      emit(Success());
    } catch (ex) {
      emit(Failure());
    }
  }
}
