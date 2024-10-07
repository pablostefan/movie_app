import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/presentations/theme/app_colors.dart';
import 'package:movie_app/features/movies/presentations/theme/typography/font_size.dart';
import 'package:movie_app/features/movies/presentations/theme/typography/font_weight.dart';
import 'package:movie_app/features/movies/presentations/theme/typography/line_height.dart';

extension TypographyExtension on Text {
  Text bodyExtraSmallMedium({TextStyle? style}) {
    TextStyle defaultStyle = _buildTextStyle(
        fontSize: TypographyFontSize.extraSmall,
        fontWeight: TypographyFontWeight.medium,
        height: TypographyLineHeight.body,
        mergeStyle: style);

    return _applyTextStyle(defaultStyle);
  }

  Text bodySmallMedium({TextStyle? style}) {
    TextStyle defaultStyle = _buildTextStyle(
        fontSize: TypographyFontSize.small,
        fontWeight: TypographyFontWeight.medium,
        height: TypographyLineHeight.body,
        mergeStyle: style);

    return _applyTextStyle(defaultStyle);
  }

  Text titleBaseBold({TextStyle? style}) {
    TextStyle defaultStyle = _buildTextStyle(
        fontSize: TypographyFontSize.base,
        fontWeight: TypographyFontWeight.bold,
        height: TypographyLineHeight.title,
        mergeStyle: style);

    return _applyTextStyle(defaultStyle);
  }

  Text _applyTextStyle(TextStyle textStyle) {
    return Text(data!,
        style: textStyle,
        key: key,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior);
  }

  TextStyle _buildTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    double? letterSpacing,
    TextStyle? mergeStyle,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontStyle: FontStyle.normal,
      height: height,
      color: AppColors.monoBlack,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
    ).merge(mergeStyle);
  }

  Text color(Color color) {
    return Text(data!,
        style: style!.copyWith(color: color),
        key: key,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior);
  }
}
