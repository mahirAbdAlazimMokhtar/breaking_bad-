import 'package:breaking_bad_series/business_logic/bloc/cubit/characters_cubit.dart';
import 'package:breaking_bad_series/constants/strings.dart';
import 'package:breaking_bad_series/data/models/character_model.dart';
import 'package:breaking_bad_series/data/repository/characters_repositry.dart';
import 'package:breaking_bad_series/data/web_services/characters_web_services.dart';
import 'package:breaking_bad_series/ui/screens/charactersDetails_screen.dart';
import 'package:breaking_bad_series/ui/screens/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRoutes() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  //this method to create routes btw screens by normal route => return type of Route
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) =>
               charactersCubit ,
            child:const CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        final character = settings.arguments as Character;

        return MaterialPageRoute(
            builder: (_) =>  BlocProvider(
                create: (BuildContext context)=> CharactersCubit(charactersRepository),
                 child: CharactersDetailsScreen(character: character,)));
    }
  }
}
