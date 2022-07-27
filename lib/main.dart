import 'package:flutter/material.dart';
import 'package:poke_api/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
      },
    );
  }
}
