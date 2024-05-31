import 'package:app_lampara/provider/getit.dart';
import 'package:app_lampara/routes/routes.dart';
import 'package:app_lampara/service/navigation_service.dart';
//import 'package:domus/src/screens/about_screen/about_us_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_lampara/src/screens/home_screen/home_screen.dart';



void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app_lampara',
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        fontFamily: 'Nato Sans',
        textSelectionTheme: const TextSelectionThemeData(
          // Set Up for TextFields
          cursorColor: Colors.grey,
          selectionColor: Colors.blueGrey,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF2F2F2),
          //secondary: Color(0xFFF4AE47),
          surface: Color.fromARGB(240, 21, 18, 10),
          // ignore: deprecated_member_use
          background: Color.fromRGBO(90, 86, 77, 1), //color de fondo
          error: Color.fromARGB(255, 143, 36, 56),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          // ignore: deprecated_member_use
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color.fromRGBO(255, 255, 255, 0.965), //hola
          ),
          headlineMedium: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color.fromRGBO(215,198,172, 20), //luces y todo
          ),
          headlineSmall: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color.fromRGBO(215,198,172, 20), //tab bar
          ),
          titleLarge: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color.fromARGB(255, 249, 249, 249),
          ),
          titleMedium: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color.fromRGBO(215,198,172, 20),
          ),
          titleSmall: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          bodyLarge: TextStyle( // equivalent to bodyText1
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Color.fromRGBO(215,198,172, 20),
          ),
          bodyMedium: TextStyle( // equivalent to bodyText2
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Color.fromRGBO(215,198,172, 20),
          ),
        ),
      ),
      routes: routes,
      home:  const HomeScreen(),
    );
  }
}
