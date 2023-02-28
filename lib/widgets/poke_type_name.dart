import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeNameType({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
       
           
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? '',
                  style: Constants.getPokemonTextStyle(),
                ),
              ),
              Text(
                '#${pokemon.num}',
                style: Constants.getPokemonTextStyle(),
              ),
            ],
          ),
          SizedBox(height: 0.02.sh,),
          Chip(
              label: Text(
            pokemon.type!.join(' , '),
            style: Constants.getTypeChipStyle(),
          )),
        ],
      ),
    );
  }
}
