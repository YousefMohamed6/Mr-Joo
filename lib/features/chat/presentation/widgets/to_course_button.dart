import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mrjoo/core/widgets/custom_icon_button.dart';
import 'package:mrjoo/features/course/presentation/views/course_view.dart';

class ToCourseButton extends StatelessWidget {
  const ToCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: const Icon(Icons.navigate_next),
      iconSize: 30.w,
      onPressed: () {
        context.pushNamed(CourseView.routeName);
      },
    );
  }
}
