import 'package:app_lampara/src/screens/home_screen/home_screen.dart';
import 'package:app_lampara/view/led_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_lampara/provider/getit.dart';
import 'package:app_lampara/routes/routes.dart';
import 'package:app_lampara/service/navigation_service.dart';

void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return MaterialApp(
      title: 'app_notificaciones',
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        fontFamily: 'Nato Sans',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.grey,
          selectionColor: Colors.blueGrey,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFF2F2F2),
          surface: Color.fromARGB(240, 21, 18, 10),
          background: Color.fromRGBO(90, 86, 77, 1),
          error: Color.fromARGB(255, 143, 36, 56),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color.fromRGBO(255, 255, 255, 0.965),
          ),
          headlineMedium: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color.fromRGBO(215,198,172, 20),
          ),
          headlineSmall: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color.fromRGBO(215,198,172, 20),
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
          bodyLarge: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: Color.fromRGBO(215,198,172, 20),
          ),
          bodyMedium: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            color: Color.fromRGBO(215,198,172, 20),
          ),
        ),
      ),
      routes: routes,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == MyHomePage.routeName) {
          return MaterialPageRoute(builder: (context) => MyHomePage());
        }
        return null;
      },
      home: const HomeScreen(),
    );
  }
}
