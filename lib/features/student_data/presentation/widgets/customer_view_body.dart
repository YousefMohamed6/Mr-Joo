import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mrjoo/features/student_data/presentation/manager/customer_cubit.dart';
import 'package:mrjoo/features/student_data/presentation/widgets/address_text_field.dart';
import 'package:mrjoo/features/student_data/presentation/widgets/customer_image.dart';
import 'package:mrjoo/features/student_data/presentation/widgets/email_text_field.dart';
import 'package:mrjoo/features/student_data/presentation/widgets/full_name_text_field.dart';
import 'package:mrjoo/features/student_data/presentation/widgets/next_button.dart';
import 'package:mrjoo/features/student_data/presentation/widgets/phone_text_field.dart';

class CustomerViewBody extends StatelessWidget {
  const CustomerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: BlocProvider.of<CustomerCubit>(context).formKey,
      child: ListView(
        children: const [
          CustomerImage(),
          FullNameTextField(),
          SizedBox(height: 8),
          EmailTextFeild(),
          SizedBox(height: 8),
          PhoneTextField(),
          SizedBox(height: 8),
          AddressTextField(),
          SizedBox(height: 24),
          NextButton(),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
