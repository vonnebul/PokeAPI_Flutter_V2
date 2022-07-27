import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:poke_api/api/pokeapi.dart';
import 'package:poke_api/models/poke_model.dart';
import 'package:poke_api/widgets/affichage_pokemon.dart';




class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pokemon> pokemon = List.empty();

// InitState: permet d'effectuer les actions situé dans le initState au lancement de la classe (widget)
  @override
  void initState() {
    super.initState();
    getLesPokemon();
  }

// fonction récupérant la liste de pokémon, qui va stocker les données nécessaire dans un setState et
// retournant le Modele pokemon
  void getLesPokemon() async {
    PokeAPI.getPokemon().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
          return Pokemon.fromJson(element.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ici le body va retourner un widget appeler grille de Pokemon
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
      ),
      body: AffichagePpokemon(pokemon: pokemon),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // a compléter
        },
        tooltip: 'Ajouter',
        child: const Icon(
          Icons.plumbing_sharp,
        ),
      ),
    );
  }
}
