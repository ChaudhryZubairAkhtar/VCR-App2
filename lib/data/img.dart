/*Load image from folder assets/images/
 */
import 'package:flutter/material.dart';

import 'my_colors.dart';
import 'textstyles.dart';

class Img {
  static String get(String? name){
    return 'assets/images/$name';
  }
}

Widget myButton(
    {String? buttonText = "",
    dynamic onPressed,
    bool isOutlined = false,
    bool isMargin = true,
    Color color = MyColors.blue,
    bool isGradient = true,
    double radius = 8,
    double height = 48,
    double? width,
    Widget? widget,
    Color outLineColor = MyColors.buttonOutlined,
    bool isBackgroundNull = false, required Text child, required ButtonStyle style}) {
  return Container(
    width: width ?? double.infinity,
    height: height,
    margin: isMargin ? const EdgeInsets.only(left: 24, right: 24) : null,
    decoration: widget != null || isBackgroundNull || isOutlined
        ? null
        : BoxDecoration(
            borderRadius: BorderRadius.circular(radius), color: color),
    child: MaterialButton(
      onPressed: onPressed,
      color: (isOutlined || isBackgroundNull) ? null : color,
      shape: isBackgroundNull
          ? null
          : RoundedRectangleBorder(
              side: BorderSide(
                color: outLineColor,
                width: isOutlined ? 1 : 0,
                style: isOutlined ? BorderStyle.solid : BorderStyle.none,
              ),
              borderRadius: BorderRadius.circular(radius)),
      child: widget ??
          Text(
            buttonText!,
            style: textStyleSmallButton(
                color: isBackgroundNull || isOutlined ? color : MyColors.white),
          ),
    ),
  );
}
Widget myTextField(
    {String hintText = "",
    bool enabled = true,
    bool isAllProduct = false,
    bool isPassword = false,
    bool showpassword = false,
    Widget? suffixIcon,
    var prefexIcon,
    Color color = MyColors.white,
    int? maxLength,
    double radius = 8,
    TextEditingController? controller,
    bool isMultiLine = false,
    double height = 48}) {
  return SizedBox(
    height: isMultiLine ? null : height,
    child: TextField(
      enabled: enabled
      ,
      controller: controller,
      obscureText: showpassword,
      textAlign: maxLength != null ? TextAlign.center : TextAlign.start,
      textAlignVertical: TextAlignVertical.bottom,
      maxLength: maxLength,
      style: maxLength != null ? textStyleH1() : textStyleSmallButton(),
      decoration: InputDecoration(
        border: border(radius: radius, isFocused: false),
        enabledBorder: border(radius: radius, isFocused: false),

        // focusedBorder: border(),
        filled: true,
        counterText: "",
        suffixIcon: suffixIcon,
        prefixIcon: prefexIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage(Img.get(prefexIcon)),
                  size: 5,
                ),
              ),
        hintStyle: textStyleSmallText(color: MyColors.buttonOutlined),
        hintText: hintText,
        fillColor: color,
      ),
    ),
  );
}

border({required double radius, required bool isFocused}) {
}
