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
          character.nickName,
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

  Widget characterInfo(String title, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,

            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16.0,

            ),
          ),
        ],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
  //divider
  Widget buildDivider(double endIndent){
    return Divider(
      color: MyColors.myYellow,
      height: 30.0,
      endIndent:endIndent ,
      thickness: 2.0,
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
                  padding: const EdgeInsetsDirectional.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      characterInfo('job : ', character.jobs.join(' / ')),
                      buildDivider(315.0),
                      characterInfo('Appeared in : ', character.categoryForTwoSeries),
                      buildDivider(250.0),
                      characterInfo('Seasons : ', character.appearanceOfSeasons.join(' / ')),
                      buildDivider(280.0),
                      characterInfo('Status : ', character.statusIfDeadOrAlive),
                      buildDivider(300.0),
                      character.betterCallSaulAppearance.isEmpty ? Container() :
                      characterInfo('Better Call Saul Seasons : ', character.betterCallSaulAppearance.join(' / ')),
                      character.betterCallSaulAppearance.isEmpty ? Container() :
                      buildDivider(150.0),
                      characterInfo('Actor/Actress : ', character.actorName),
                      buildDivider(235.0),
                      const SizedBox(height: 20.0,),
                    ],
                  ),
                ),
                const SizedBox(height: 500.0,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
