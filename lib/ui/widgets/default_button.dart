import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class DefaultButton extends StatelessWidget {
  final BuildContext? context;
  final String title;
  final VoidCallback onPress;
  final double? width;
  final double? height;
  final Color textColor;
  final Color buttonColor;
  final double textSize;
  final FontWeight fontWeight;
  final bool isLoading;
  final bool outlineBorder;

  const DefaultButton({
    super.key,
    required this.onPress,
    this.width,
    this.height,
    this.title = "Click Me",
    this.textColor = Colors.white,
    this.context,
    this.textSize = 18.0,
    this.fontWeight = FontWeight.w500,
    this.buttonColor = AppColors.primaryColor,
    this.isLoading = false,
    this.outlineBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      width: width ?? 80,
      decoration: BoxDecoration(
        border: outlineBorder
            ? Border.all(
                color: AppColors.primaryColor,
              )
            : null,
        color: buttonColor,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(11),
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          borderRadius: BorderRadius.circular(11),
          onTap: onPress,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: textColor,
                          fontSize: textSize,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
