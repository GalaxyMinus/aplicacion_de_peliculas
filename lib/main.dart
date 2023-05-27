import 'package:flutter/material.dart';
import 'package:aplicacion_de_peliculas/providers/movie_provider.dart';
import 'package:aplicacion_de_peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MoviesProvider())],
      child: const MyApp(),
    );
  }  
}

class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicación de Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const Home_Screen(),
        'details': (_) => const Details_Screen()
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.redAccent,
        )),
    );
  }
}