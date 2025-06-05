import 'package:flutter/material.dart';


import '../../app/components/common/style/theme/assets_extension.dart';
import '../../app/components/common/style/theme/color_extension.dart';

extension ContextExt on BuildContext {
  //Color

  // MyColors get color => Theme.of(this).extension<MyColors>()!;
  // //image
  // MyAssets get assets => Theme.of(this).extension<MyAssets>()!;

  //style
  //TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

  // //localization
  // String translate(String langKey) {
  //   return AppLocalizations.of(this)!.translate(langKey).toString();
  // }

  //routes

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, (routes) => false);
  }

  void pop() {
    return Navigator.of(this).pop();
  }
}
