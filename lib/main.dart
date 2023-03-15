import 'package:flutter/material.dart';
import 'package:local_storage/preferences/preferences.dart';
import 'package:local_storage/providers/theme_provider.dart';
import 'package:local_storage/screens/home_sc.dart';
import 'package:local_storage/screens/settings_sc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // needed cause Preferences.init() call widgets to initialize before anything else
  await Preferences.init();
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
