import 'package:mrjoo/cubits/chat/chat_cubit.dart';
import 'package:mrjoo/cubits/chat/chat_state.dart';
import 'package:mrjoo/helper/show_message.dart';
import 'package:mrjoo/views/screens/login_page.dart';
import 'package:mrjoo/views/widgets/background.dart';
import 'package:mrjoo/views/widgets/custom_appbar.dart';
import 'package:mrjoo/views/widgets/custom_chat_page.dart';
import 'package:mrjoo/views/widgets/custom_icon_button.dart';
import 'package:mrjoo/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = "ChatPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Chat',
        actions: [
          CustomIconButton(
            icon: const Icon(Icons.logout_outlined),
            iconSize: 40,
            onPressed: () {
              BlocProvider.of<ChatCubit>(context).signOut();
            },
          ),
        ],
      ),
      body: Background(
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            if (state is SignOut) {
              ShowMessage.show(context, msg: 'LogOut');
              Navigator.popAndPushNamed(context, LoginPage.id);
            }
          },
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              );
            } else if (state is Success) {
              return CustomChatPage(
                messages: state.messages,
                formKey: BlocProvider.of<ChatCubit>(context).formKey,
                scrollController:
                    BlocProvider.of<ChatCubit>(context).scrollController,
                controller: BlocProvider.of<ChatCubit>(context).messageCtrl,
                onFieldSubmitted: (message) {
                  BlocProvider.of<ChatCubit>(context).sendMessage();
                },
                onPressed: () {
                  BlocProvider.of<ChatCubit>(context).sendMessage();
                },
              );
            } else {
              return const Center(
                child: CustomText(text: 'SomeThing Wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
