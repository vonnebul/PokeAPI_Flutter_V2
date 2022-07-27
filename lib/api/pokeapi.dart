import 'package:http/http.dart' as http;
import 'dart:async';

// création d'une classe permettant d'accéder à la pokéAPI
class PokeAPI {
  static Future<http.Response> getPokemon() =>
      http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));
}