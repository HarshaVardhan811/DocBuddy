import 'package:flutter/material.dart';
import 'package:newproj/screens/home_screen.dart';
import 'package:newproj/screens/login_screen.dart';
import 'package:newproj/screens/register_screen.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
// import 'screens/login_screen.dart';
// import 'screens/home_screen.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Doctor',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (_) => SplashScreen(),
        '/login': (_) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (_) => HomeScreen(),
      },
    );
  }
}
