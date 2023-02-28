import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/ui_helper.dart';

import '../model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildInformatinRow("Name", pokemon.name),
            _buildInformatinRow("Heigh", pokemon.height),
            _buildInformatinRow("Weight", pokemon.weight),
            _buildInformatinRow("Spawn Time", pokemon.spawnTime),
            _buildInformatinRow("Weakness", pokemon.weaknesses),
            _buildInformatinRow("Pre Evolotion", pokemon.prevEvolution),
            _buildInformatinRow("Next Evolotion", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }
}


_buildInformatinRow(String label,dynamic value){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

    Text(label,style: Constants.getPokeInfoLabelTextStyle(),),
    if(value is List && value.isNotEmpty)
      Text(value.join(' , '))
    else if (value == null)
      Text("Not Avalibe",style: Constants.getPokeInfoTextStyle(),)
    else
      Text(value,style: Constants.getPokeInfoTextStyle(),)
 
  ],



  );


}