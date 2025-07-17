import 'package:flutter/material.dart';
import 'package:flutter_training/main.dart';
import 'package:flutter_training/res/colors.dart';
import 'package:flutter_training/widget/base_button.dart';
import 'package:flutter_training/widget/base_text_label.dart';
import 'package:flutter_training/util/localization_service.dart';

class BaseDialog {
  static void showNotifyDialog({
    required String message,
    required VoidCallback onConfirm,
  }) {
    final context = NavigationService.context;
    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 30,
                children: [
                  const Icon(
                    Icons.notifications_active_rounded,
                    size: 50,
                    color: AppColors.todoPurple,
                  ),
                  BaseTextLabel(
                    message,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.black,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BaseButton(
                          backgroundColor: AppColors.todoPurple,
                          title: 'OK',
                          titleColor: AppColors.white,
                          borderRadius: 20,
                          onTap: () {
                            Navigator.pop(context);
                            onConfirm();
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BaseButton(
                          backgroundColor: Colors.grey[200],
                          title: LocalizationService.current.cancel,
                          titleColor: AppColors.black,
                          borderRadius: 20,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

}
