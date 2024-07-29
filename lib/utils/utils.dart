import 'package:flutter/material.dart';
import '../constants/app_strings.dart';
import '../constants/screen_utils.dart';
import '../ui/widgets/default_button.dart';

abstract class Utils {
  static void okAlertDialog(BuildContext context, String text,
      [VoidCallback? onPress]) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              height: 28,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      top: 2.5,
                      left: 5,
                      bottom: 2,
                    ),
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  kHeight(3),
                  SizedBox(
                    // width: 45.w,
                    // height: 6.h,
                    child: DefaultButton(
                      onPress: onPress ??
                          () {
                            Navigator.pop(context);
                          },
                      title: AppStrings.ok,
                      // title: "Ok",
                    ),
                  ),
                  kHeight(1),
                ],
              ),
            ),
          );
        });
  }
}
