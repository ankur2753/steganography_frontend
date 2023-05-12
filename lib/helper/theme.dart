import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ThemeController {
  ValueNotifier<ThemeMode> themeMode =
      ValueNotifier<ThemeMode>(ThemeMode.light);

  void toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
  }

  void dispose() {
    themeMode.dispose();
  }
}

ThemeController useThemeController(
    BuildContext context, ThemeController controller) {
  useEffect(() {
    final brightness = MediaQuery.of(context).platformBrightness;
    controller.themeMode.value =
        brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return () => controller.dispose();
  }, [controller]);

  return controller;
}

class DarkModeSwitch extends HookWidget {
  final ThemeController controller;

  const DarkModeSwitch({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = useThemeController(context, controller);

    return Switch(
      value: themeController.themeMode.value == ThemeMode.dark,
      onChanged: (_) {
        themeController.toggleTheme();
      },
    );
  }
}
