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

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    Brightness brightness = WidgetsBinding.instance.window.platformBrightness;
    setState(() {
      if (brightness.name == 'light') {
        isDarkMode = false;
      } else {
        isDarkMode = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'AaShuYunSong',
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
      darkTheme: ThemeData(
        fontFamily: 'AaShuYunSong',
        brightness: Brightness.dark,
      ),
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
