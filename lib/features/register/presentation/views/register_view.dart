import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/utils/constants/fonts.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/core/widgets/background.dart';
import 'package:mrjoo/core/widgets/custom_text.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_View.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_cubit.dart';
import 'package:mrjoo/features/register/data/register_cubit/register_state.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/registet_view_body.dart';
import 'package:mrjoo/features/register/presentation/views/widgets/sigin_with_google_button.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          centerTitle: true,
          title: const CustomText(
            text: "Register",
            fontSize: 24,
            fontFamily: kPacificoFont,
          ),
          actions: const [
            SignWithGoogleButton(),
          ],
          backgroundColor: kAppBarColor,
        ),
        body: Background(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is Success) {
                ShowMessage.show(context, msg: 'Success');
                Navigator.popAndPushNamed(context, ChatView.id);
              } else if (state is Failure) {
                ShowMessage.show(context, msg: 'Sign Up is Faild');
              } else if (state is RegisterFailure) {
                ShowMessage.show(context, msg: state.errMessage);
              }
            },
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const RegisterViewBody();
              }
            },
          ),
        ),
      ),
    );
  }
}
