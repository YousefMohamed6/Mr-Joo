import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/show_message.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';
import 'package:mrjoo/features/login/presentation/views/login_view.dart';
import 'package:mrjoo/features/payment/presentation/views/widgets/webview_body.dart';

class CourseViewBody extends StatelessWidget {
  const CourseViewBody({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseCubit, CourseState>(
      listener: (context, state) {
        if (state is SignOut) {
          ShowMessage.show(context, msg: 'Sign out');
          Navigator.popAndPushNamed(context, LoginView.id);
        } else {
          BlocProvider.of<CourseCubit>(context).getUrl();
        }
      },
      builder: (context, state) => WebViewBody(url: url),
    );
  }
}
