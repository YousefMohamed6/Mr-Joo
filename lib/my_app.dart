import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/auth/forget_Password/view/forget_password_view.dart';
import 'package:mrjoo/features/auth/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:mrjoo/features/chat/presentation/views/chat_View.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/course_view.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/customer/presentation/views/customer_view.dart';
import 'package:mrjoo/features/home/presentation/views/home_view.dart';
import 'package:mrjoo/features/payment/presentation/views/payment_view.dart';
import 'package:mrjoo/features/privacy_policey/views/privacy_and_policy.dart';
import 'package:mrjoo/features/splash/views/splash_view.dart';
import 'package:mrjoo/features/terms/views/terms_and_conditions_view.dart';

class MrJoo extends StatelessWidget {
  const MrJoo({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CustomerCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => CourseCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          SplashView.id: (context) => const SplashView(),
          HomeView.id: (context) => const HomeView(),
          LoginView.id: (context) => const LoginView(),
          CustomerView.id: (context) => const CustomerView(),
          PaymentView.id: (context) => const PaymentView(),
          ChatView.id: (context) => const ChatView(),
          CourseView.id: (context) => const CourseView(),
          TermsConditionsView.id: (context) => const TermsConditionsView(),
          PrivacyPolicyView.id: (context) => const PrivacyPolicyView(),
          ForgetPasswordView.id: (context) => const ForgetPasswordView(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: SplashView.id,
      ),
    );
  }
}
