import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class RoundButton extends StatelessWidget {

  final String title;
  final bool loading ;
  final VoidCallback onPress;
  const RoundButton({super.key, required this.title, this.loading = false, required this.onPress});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final Width = MediaQuery.of(context).size.width * 1;
    return InkWell(
      onTap: onPress,
      child: Container(
            height: height * 0.06,
            width: Width * 0.35,
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(15),
            ),
        child:  Center(child: Text(title, style: const TextStyle(color: AppColors.whiteColor),)),
      ),
    );
  }
}
