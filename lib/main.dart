import 'package:flutter/material.dart';
import 'package:kami/src/rust/frb_generated.dart';

import 'screens/components/router.dart';
import 'screens/init_screen.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        routeObserver,
      ],
      theme: _lightTheme,
      darkTheme: _darkTheme,
      home: const InitScreen(),
    );
  }
}

final _defaultLight = ThemeData.light();
final _defaultDark = ThemeData.dark();

final _lightTheme = _defaultLight.copyWith(
  appBarTheme: _defaultLight.appBarTheme.copyWith(
    backgroundColor: Color.alphaBlend(
      Colors.redAccent.shade700.withOpacity(.05),
      _defaultLight.scaffoldBackgroundColor,
    ),
    foregroundColor: _defaultLight.textTheme.bodyMedium?.color,
    elevation: 0.5,
  ),
  tabBarTheme: _defaultLight.tabBarTheme.copyWith(
    labelColor: Colors.red.shade600,
    unselectedLabelColor: Colors.grey.shade600,
    labelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w900,
      color: Colors.red.shade600,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(
        width: 2,
        color: Colors.red,
      ),
    ),
  ),
  navigationBarTheme: _defaultLight.navigationBarTheme.copyWith(
    indicatorColor: Colors.transparent,
    backgroundColor: Colors.white,
    labelTextStyle: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return TextStyle(
          fontSize: 12,
          color: Colors.red.shade600,
          fontWeight: FontWeight.w500,
        );
      } else {
        return TextStyle(
          fontSize: 12,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        );
      }
    }),
    iconTheme: MaterialStateProperty.resolveWith((state) {
      if (state.contains(MaterialState.selected)) {
        return IconThemeData(
          size: 24,
          color: Colors.red.shade600,
        );
      } else {
        return IconThemeData(
          size: 24,
          color: Colors.grey.shade600,
        );
      }
    }),
  ),
);

final _darkTheme = _defaultDark.copyWith();
