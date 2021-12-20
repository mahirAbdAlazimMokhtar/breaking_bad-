part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  //when the data come return list of characters
  final List<Character> character;
  CharactersLoaded(this.character);
}
class CharactersQuotesLoaded extends CharactersState {
  //when the data come return list of characters
  final List<Quotes> quotes;
  CharactersQuotesLoaded(this.quotes);
}