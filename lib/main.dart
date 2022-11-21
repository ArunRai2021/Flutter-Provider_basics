import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/auth_provider.dart';
import 'package:provider_tutorial/provider/count_provider.dart';
import 'package:provider_tutorial/provider/dark_themeChange_provider.dart';
import 'package:provider_tutorial/provider/example_one_provider.dart';
import 'package:provider_tutorial/provider/favorite_provider.dart';
import 'package:provider_tutorial/screens/Login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // when we have only single class then we use singleProvider by using return ChangeNotifierProvider
    // when we have multiple class for provider then we use multi provider which is use for multiple provider class
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.red,
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.yellow,
                primaryColor: Colors.purple,
                iconTheme: const IconThemeData(color: Colors.pink),
                appBarTheme: AppBarTheme(backgroundColor: Colors.teal)),
            home: const LoginScreen(),
          );
        }));
  }
}
