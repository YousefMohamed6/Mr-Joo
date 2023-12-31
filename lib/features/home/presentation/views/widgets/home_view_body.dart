import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/images.dart';
import 'package:mrjoo/core/widgets/avatar.dart';
import 'package:mrjoo/features/home/presentation/views/widgets/teacher_accounts.dart';
import 'package:mrjoo/features/home/presentation/views/widgets/teacher_data.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 84),
        Avatar(image: kAvaterLogo),
        SizedBox(height: 56),
        TeacherData(),
        TeacherAccounts(),
      ],
    );
  }
}
