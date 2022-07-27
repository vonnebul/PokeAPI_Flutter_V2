import 'package:flutter/material.dart';
import 'package:poke_api/models/poke_model.dart';
import 'package:poke_api/widgets/pokemonPosition.dart';


class AffichagePpokemon extends StatefulWidget {
  final List<Pokemon> pokemon;
  const AffichagePpokemon({Key? key, required this.pokemon}) : super(key: key);

  @override
  _AffichagePpokemonState createState() => _AffichagePpokemonState();
}

class _AffichagePpokemonState extends State<AffichagePpokemon> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width > 1000)
        ? 5
        : (width > 700)
            ? 4
            : (width > 450)
                ? 3
                : 2;

    return GridView.count(
      padding: const EdgeInsets.all(7),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      semanticChildCount: 250,
      childAspectRatio: 200 / 244,
      physics: const BouncingScrollPhysics(),
      children: widget.pokemon
          .map(
            (pokemon) => PokemonPosition(
              id: pokemon.id,
              name: pokemon.name,
              image: pokemon.img,
            ),
          )
          .toList(),
    );
  }
}
