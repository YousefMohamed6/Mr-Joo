import 'package:flutter/material.dart';
import 'package:mrjoo/core/utils/constants/colors.dart';
import 'package:mrjoo/core/widgets/asset_image.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem(
      {super.key,
      required this.imagePath,
      required this.select,
      required this.onTap});
  final String imagePath;
  final bool select;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
            ),
            margin: const EdgeInsets.all(16),
            child: CustomAssetImage(
              imagePath: imagePath,
              width: (MediaQuery.of(context).size.width * 0.4),
              height: (MediaQuery.of(context).size.height * 0.25),
            ),
          ),
        ),
        select
            ? const Icon(
                Icons.add_task,
                color: kMainTextColor,
              )
            : const SizedBox(),
      ],
    );
  }
}
