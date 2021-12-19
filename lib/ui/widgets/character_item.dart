import 'package:breaking_bad_series/constants/my_colors.dart';
import 'package:breaking_bad_series/data/models/character_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
      padding: const EdgeInsetsDirectional.all(4.0),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: GridTile(
        child: Container(
          color: MyColors.myGrey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/loading.gif',
                  image: character.image)
              : Image.asset(
                  'assets/images/placeholder.gif',
                ),
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 1.3,
              fontSize: 16.0,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
