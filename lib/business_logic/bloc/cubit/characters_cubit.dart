import 'package:bloc/bloc.dart';
import 'package:breaking_bad_series/data/models/character_model.dart';
import 'package:breaking_bad_series/data/models/quotes.dart';
import 'package:breaking_bad_series/data/repository/characters_repositry.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  //ده هنا الاوبجكت البستقبل فيهو البيانات بتاعت الريبو 
  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

   List <Character> characters =[];
   List <Quotes> quotes =[];
  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((characters)  {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

   void getCharacterQuote(String charName){
    charactersRepository.getAllCharactersQuotes(charName).then((quotes)  {
      emit(CharactersQuotesLoaded(quotes));
    });
  }
}
