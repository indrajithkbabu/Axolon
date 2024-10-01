import 'package:contactapp/app/helpers/common_widgets/custom_elevated_button.dart';
import 'package:contactapp/app/utils/colors.dart';
import 'package:contactapp/app/utils/text_styles.dart';
import 'package:contactapp/app/utils/values.dart';
import 'package:flutter/material.dart';

class ConfirmAlert {
  ConfirmAlert();

  static void showConfirmAlert({
    required BuildContext context,
    required String contentText,
    void Function()? onPressedContinue,
    String? confirmTitle,
    void Function()? onPressedCancel,
    String? cancelTitle,
    Color? color,
  }) {
    showDialog<dynamic>(
      context: context,
      // barrierDismissible: false,
      barrierColor: color,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          icon: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryColor,
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                size: 50,
              )),
          content: Text(
            contentText,
            style: TextStyles.titletext.copyWith(color: AppColors.blackColor),
            textAlign: TextAlign.center,
          ),
          actions: [
            CustomElevatedButton(
              text: cancelTitle ?? 'cancel',
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressedCancel != null) {
                  onPressedCancel();
                }
              },
              bgColor: AppColors.primaryColor,
              borderSide: BorderSide(color: AppColors.greyColor),
            ),
            if (confirmTitle != null && onPressedContinue != null) ...[
              AppSpacing.gapMedium(),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: confirmTitle,
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPressedContinue();
                  },
                  bgColor: AppColors.primaryColor,
                  textColor: Colors.white,
                ),
              )
            ],
          ],
        );
      },
    );
  }
}
