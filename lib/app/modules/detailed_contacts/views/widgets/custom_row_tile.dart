import 'package:contactapp/app/utils/colors.dart';
import 'package:contactapp/app/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomRowTile extends StatelessWidget {
  const CustomRowTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.prefixIcon,
    this.suffixIcon,
  });

  final String title;
  final String? subtitle;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 80,
        child: Card(
            child: ListTile(
          leading: Icon(
            prefixIcon,
            color: AppColors.primaryColor,
          ),
          title: Padding(
            padding: EdgeInsets.only(top: subtitle == null ? 20 : 5),
            child: Text(
              title,
              style: TextStyles.bodyText.copyWith(color: AppColors.blackColor),
            ),
          ),
          subtitle: Text(
            subtitle ?? '',
            style: TextStyles.bodyText
                .copyWith(color: AppColors.greyColor, fontSize: 14),
          ),
          trailing: Icon(suffixIcon),
        )),
      ),
    );
  }
}
