import 'package:flutter/material.dart';
import 'package:flutter_yiyan/ui/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          const HomePage(),
          Positioned(
            right: 0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isDarkMode = !isDarkMode;
                });
              },
              icon:
                  Icon(isDarkMode ? Icons.dark_mode : Icons.dark_mode_outlined),
            ),
          )
        ]),
      ),
    );
  }
}
