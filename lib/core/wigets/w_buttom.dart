import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productive/assets/constants/colors.dart';

class WButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final bool isDisabled;
  final bool isLoading;
  final TextStyle? style;
  final Color? buttonColor;

  const WButton(
      {required this.onTap,
        this.isDisabled = false,
        this.isLoading = false,
        this.text = '',
        this.style,
        this.buttonColor,
        super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isDisabled && !isLoading) {
          onTap();
        }
      },
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isDisabled ? disabledButtonColor : buttonColor ?? wButtonColor,
        ),
        child: isLoading
            ? const CupertinoActivityIndicator()
            : Text(
          text,
          style: style ??
              TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: white.withOpacity(.3)),
        ),
      ),
    );
  }
}