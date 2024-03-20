import '../pages/layoutpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'configure/navigation_service.dart';
import '../res/constants.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  setupLocator();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({Key? key, required this.savedThemeMode}) : super(key: key);
  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ),
      dark: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white,)
            .copyWith(
          bodyLarge: const TextStyle(color: bodyTextColor),
          bodyMedium: const TextStyle(color: bodyTextColor),
        ),
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Francisco Javier Quiles Ruiz',
        theme: theme,
        darkTheme: darkTheme,
        home: LayoutTemplate(),
      ),
    );
  }
}
