import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/course/data/course_view_cubit/course_view_cubit.dart';
import 'package:mrjoo/features/course/presentation/widgets/update_url_button.dart';

class UpdateUrlView extends StatelessWidget {
  const UpdateUrlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: BlocProvider.of<CourseCubit>(context).formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            CustomFormField(
              controller: BlocProvider.of<CourseCubit>(context).courseCtrl,
              hintText: 'Course Link',
            ),
            const SizedBox(height: 16),
            const UpdateUrlButton(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
