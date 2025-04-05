// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_one/Pages/login/widgets/sprinkbutton.dart';

class CustomSpinkitdButton extends StatelessWidget {
  final Widget? child;
  final String? label;
  final String? labelLoading;
  final Color? color;
  // final Color? bordercolor;

  final Color? textcolor;
  final VoidCallback? onTap;
  final bool isLoading;
  final double width;
  final double height;
  final double? labelSize;
  final EdgeInsetsGeometry? margin;

  const CustomSpinkitdButton(
      {Key? key,
      required this.label,
      required this.labelLoading,
      this.color,
      // this.bordercolor,
      this.child,
      required this.onTap,
      this.isLoading = false,
      this.width = double.infinity,
      this.height = 47,
      this.labelSize,
      this.margin,
      this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: (isLoading == true) ? () {} : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            // side: BorderSide(
            //   color: bordercolor ?? Colors.white, // Set the border color here
            //   width: 1, // Set border width (you can adjust this value)
            // ),
          ),
        ),
        child: (isLoading == true)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitThreeBounce(
                    size: 15,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    labelLoading.toString(),
                    style: _theme.textTheme.labelLarge
                        ?.copyWith(color: textcolor ?? Colors.white),
                  )
                ],
              )
            : (label == '' || label == null)
                ? child
                : Text(
                    label.toString(),
                    style: _theme.textTheme.labelLarge?.copyWith(
                        color: textcolor ?? Colors.white,
                        fontSize: labelSize,
                        fontWeight: FontWeight.bold),
                  ),
      ),
    );
  }
}
