import 'package:flutter/material.dart';
import 'package:task2/colortheme.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();

 var box= await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;
    void onThemeToggle () {
          setState(() {
            isDarkTheme = !isDarkTheme;
          });
        }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDo App",
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreen(
        onThemeToggle: onThemeToggle,
       
      ),
    );
  }
}
