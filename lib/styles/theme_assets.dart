import 'package:flutter/material.dart';
import 'package:flutter_template/util/extension/context_extensions.dart';

class ThemeAssets {
  ThemeAssets._();

  static String _getIcon(BuildContext context, String name) {
    if (context.isIOS) {
      return 'assets/images/icons/ios/$name.svg';
    }
    return 'assets/images/icons/android/$name.svg';
  }

  static String listIcon(BuildContext context) => _getIcon(context, 'list');

  static String settingsIcon(BuildContext context) => _getIcon(context, 'settings');

  static String addIcon(BuildContext context) => _getIcon(context, 'add');

  static String downloadIcon(BuildContext context) => _getIcon(context, 'download');

  static String closeIcon(BuildContext context) => _getIcon(context, 'close');

  static String backIcon(BuildContext context) => _getIcon(context, 'back');
}
