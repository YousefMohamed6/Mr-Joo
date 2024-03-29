import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/auth/register/data/register_cubit/register_cubit.dart';
import 'package:mrjoo/features/auth/register/presentation/views/widgets/accept_terms_row.dart';
import 'package:mrjoo/features/auth/register/presentation/views/widgets/email_form_feild.dart';
import 'package:mrjoo/features/auth/register/presentation/views/widgets/full_name_text_form_field.dart';
import 'package:mrjoo/features/auth/register/presentation/views/widgets/password_form_feild.dart';
import 'package:mrjoo/features/auth/register/presentation/views/widgets/register_button.dart';
import 'package:mrjoo/features/auth/register/presentation/views/widgets/sigin_row.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterCubit>(context).formKey,
      child: ListView(
        children: const [
          SizedBox(height: 32),
          Avatar(image: kAvaterLogo),
          SizedBox(height: 32),
          FullNametextFeild(),
          SizedBox(height: 8),
          EmailFormFeild(),
          SizedBox(height: 8),
          PasswordFormField(),
          SizedBox(height: 8),
          AcceptTermsRow(),
          SizedBox(height: 24),
          RegisterButton(),
          SizedBox(height: 4),
          SignInRow(),
        ],
      ),
    );
  }
}
