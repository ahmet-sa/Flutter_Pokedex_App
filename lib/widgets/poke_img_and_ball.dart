import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  PokeImageAndBall({super.key, required this.pokemon});

  final PokemonModel pokemon;

  String pokeballImageUrl = "images/pokeball.png";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UIHelper.CalculatePokeImgAndBall(),
            height: UIHelper.CalculatePokeImgAndBall(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Hero(
              tag: pokemon.id!,
              child: CachedNetworkImage(
                imageUrl: pokemon.img ?? "",
                width: UIHelper.CalculatePokeImgAndBall(),
                height: UIHelper.CalculatePokeImgAndBall(),
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => CircularProgressIndicator(
                  color: Colors.red,
                ),
              ),
            )),
      ],
    );
  }
}
