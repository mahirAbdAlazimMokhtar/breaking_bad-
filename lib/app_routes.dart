import 'package:breaking_bad_series/constants/strings.dart';
import 'package:breaking_bad_series/ui/screens/charactersDetails_screen.dart';
import 'package:breaking_bad_series/ui/screens/characters_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
 //this method to create routes btw screens by normal route => return type of Route
  Route? generateRoute(RouteSettings settings){
    switch (settings.name){
      case charactersScreen :
        return MaterialPageRoute(builder: (_)=>const CharactersScreen());
      case charactersDetailsScreen :
        return MaterialPageRoute(builder: (_)=>const CharactersDetailsScreen());
    }
  }
}