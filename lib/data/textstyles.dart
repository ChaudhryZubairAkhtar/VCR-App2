import 'package:flutter/cupertino.dart';
import '../data/constants.dart';

const FontWeight semiBold = FontWeight.w600;
const FontWeight medium = FontWeight.w500;
const FontWeight regular = FontWeight.w400;
const FontWeight bold = FontWeight.w700;


TextStyle textStyleH1(
    {Color? color, double? fontSize = 80, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleH2(
    {Color? color, double? fontSize = 72, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleH3(
    {Color? color, double? fontSize = 60, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleH4(
    {Color? color, double? fontSize = 48, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleH5(
    {Color? color, double? fontSize = 36, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleH6(
    {Color? color, double? fontSize = 30, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleBigTitle(
    {Color? color, double? fontSize = 24, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleTitle(
    {Color? color, double? fontSize = 20, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: regular,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleSubtitle(
    {Color? color, double? fontSize = 16, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: medium,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleBigButton(
    {Color? color, double? fontSize = 16, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: bold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleSmallButton(
    {Color? color, double? fontSize = 14, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: semiBold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleCaption(
    {Color? color, double? fontSize = 14, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: medium,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleParagraph(
    {Color? color, double? fontSize = 16, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: medium,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleSmallText(
    {Color? color, double? fontSize = 14, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: regular,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleSemiBold(
    {Color? color, double? fontSize = 14, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: semiBold,
      color: color,
      fontFamily: fontFamily);
}

TextStyle textStyleRegular(
    {Color? color, double? fontSize = 12, String fontFamily = fontName}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: regular,
      color: color,
      fontFamily: fontFamily);
}
