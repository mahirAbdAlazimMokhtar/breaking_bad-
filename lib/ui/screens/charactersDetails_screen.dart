import 'package:breaking_bad_series/constants/my_colors.dart';
import 'package:breaking_bad_series/data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;

  const CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);

//this for image and text
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 600.0,
      stretch: true,
      pinned: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickName
          ,
          // textAlign: TextAlign.start,
          style: const TextStyle(
            color: MyColors.myWhite,
          ),
        ),
        background: Hero(
          tag: character.nickName,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14.0, 14.0, 14.0, 0),
                  padding:const EdgeInsetsDirectional.all(8.0),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start ,
                    children:
                  [

                  ],),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
