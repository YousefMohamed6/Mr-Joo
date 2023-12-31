import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/customer/data/customer_cubit/customer_cubit.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/customer_image.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/full_name_text_feild.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/email_text_feild.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/next_button.dart';
import 'package:mrjoo/features/customer/presentation/views/widgets/phone_text_feild.dart';

class CustomerViewBody extends StatelessWidget {
  const CustomerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<CustomerCubit>(context).formKey,
      child: ListView(
        children: const [
          CustomerImage(),
          FullNameTextFeild(),
          SizedBox(height: 8),
          EmailTextFeild(),
          SizedBox(height: 8),
          PhoneTextFeild(),
          SizedBox(height: 24),
          NextButton(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
