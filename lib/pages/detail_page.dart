import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';
import 'package:pokedex_app/model/pokemon_model.dart';
import 'package:pokedex_app/widgets/poke_information.dart';

import '../widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = "images/pokeball.png";
    return Scaffold(
        backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                  iconSize: 24.w,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
            ),
            PokeNameType(pokemon: pokemon),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  child: Image.asset(pokeballImageUrl,
                    height: 0.15.sh,
                    fit: BoxFit.fitHeight,
                  ),
                  right: 0,
                  top: 0,
                ),
                Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: 0.13.sh,
                 
                child: PokeInformation(pokemon: pokemon)),
                Align(
                  alignment: Alignment.topCenter ,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(imageUrl: pokemon.img!,height: 0.22.sh,fit: BoxFit.fitHeight,)),
                )
              ],
            )),
          ]),
        ));
  }
}
