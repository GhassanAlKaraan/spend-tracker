
import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'package:flutter/material.dart';

import 'values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //* Main App colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1, // for disabled buttons
    // colorScheme: ColorScheme(brightness: brightness,
    //   primary: primary,
    //   onPrimary: onPrimary,
    //   secondary: secondary,
    //   onSecondary: onSecondary,
    //   error: error,
    //   onError: onError,
    //   background: background,
    //   onBackground: onBackground,
    //   surface: surface,
    //   onSurface: onSurface),
    splashColor: ColorManager.primaryOpacity70, // for inkwell color.

    //* Card View theme
    cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4),

    //* App bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16)),

    //* Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        foregroundColor: ColorManager.white, //text
        backgroundColor: ColorManager.primary, //button
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
      ),
    ),

    //* Text theme
    textTheme: TextTheme(
      displayLarge: getBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      titleMedium: getMediumStyle(color: ColorManager.grey1, fontSize: FontSize.s14),
      titleSmall: getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      bodyLarge: getRegularStyle(color: ColorManager.grey),
    ),

    //* Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey1),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.s8),
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
      ),
    ),
  );
}
