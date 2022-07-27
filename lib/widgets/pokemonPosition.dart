import 'package:flutter/material.dart';
import 'package:poke_api/widgets/pokemonData.dart';


class PokemonPosition extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const PokemonPosition({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
          padding: const EdgeInsets.all(7),
          child: Stack(
            children: [
              PokemonData(name: name, image: image),
            ],
          ),
        ),
    );
  }
}
