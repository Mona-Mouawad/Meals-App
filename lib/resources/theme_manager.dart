
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    fontFamily: FontFamilys.fontFamily,
    accentColor: ColorManager.accent,
  primarySwatch: Colors.pink,
  //  canvasColor: Color.fromRGBO(225, 254, 229, 1) ,
    canvasColor: Color.fromRGBO(225, 225, 225, 1) ,
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    //  تموج  ripple effect color

    // text theme
    textTheme: ThemeData.light().textTheme.copyWith(
      titleMedium:getBoldTextStyle(color: ColorManager.primary,fontSize: FontSize.s18),
        bodyLarge:getRegularTextStyle(color: ColorManager.white,fontSize:FontSize.s22),
      labelLarge:getSemiBoldTextStyle(color: ColorManager.primary,fontSize: FontSize.s22)
        // bodyText1: TextStyle(
      //   color: Color.fromRGBO(20, 51, 51, 1),
      // ),
      // bodyText2: TextStyle(
      //   color: Color.fromRGBO(20, 51, 51, 1),
      // ),
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
        elevation: AppSize.s4,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
// cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      shape: const StadiumBorder(),
      splashColor: ColorManager.lightPrimary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
        textStyle: getRegularTextStyle(
            color: ColorManager.white, fontSize: FontSize.s16),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // enabled Border style
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(color: ColorManager.grey, width: AppSize.s1_5)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5)),
      // error border style
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5)),
// hint text Style
      errorStyle: getRegularTextStyle(color: ColorManager.error),
      hintStyle:
          getRegularTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    ),

    bottomSheetTheme: BottomSheetThemeData(
        // elevation: AppSize.s1_5,
        backgroundColor: ColorManager.white.withOpacity(0)),
  );
}
