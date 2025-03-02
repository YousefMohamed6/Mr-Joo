import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/core/utils/constants/app_images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/auth/register/presentation/manager/register_cubit.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/accept_terms_row.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/email_form_feild.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/password_form_feild.dart';
import 'package:mrjoo/features/auth/register/presentation/widgets/register_button.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<RegisterCubit>(context).formKey,
      child: ListView(
        children: [
          SizedBox(height: 32.h),
          Avatar(image: AppImages.kAvaterLogo),
          SizedBox(height: 32.h),
          EmailFormFeild(),
          SizedBox(height: 16.h),
          PasswordFormField(),
          SizedBox(height: 16.h),
          AcceptTermsRow(),
          SizedBox(height: 24.h),
          RegisterButton(),
        ],
      ),
    );
  }
}
