import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/core/utils/constants/app_colors.dart';
import 'package:mrjoo/features/chat/presentation/manager/chat_cubit.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 16,
      onPressed: () async {
        BlocProvider.of<ChatCubit>(context).sendMessage();
      },
      child: const Icon(
        Icons.send_sharp,
        color: AppColors.kMainTextColor,
      ),
    );
  }
}
