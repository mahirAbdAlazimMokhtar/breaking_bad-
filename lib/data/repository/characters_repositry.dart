import 'package:breaking_bad_series/data/models/character_model.dart';
import 'package:breaking_bad_series/data/models/quotes.dart';
import 'package:breaking_bad_series/data/web_services/characters_web_services.dart';
// webServices >> passing data to Rep >>Repo passing Data to cubit >> cubit Passing Data to ui
class CharactersRepository {
   CharactersWebServices?  charactersWebServices ;
   //this use for passing data to repo
   CharactersRepository(this.charactersWebServices);
   //الدالة دي عشان تجيب لي اوبجكت من البيانات ال في الويب سيرفز واقدر من خلال امررها لل الكيوبت
   Future<List<Character>> getAllCharacters() async{
     //هنا عملت متغير وحينتظر البيانات الجاية من ال ويب سيرفز
     final characters = await charactersWebServices!.getAllCharacters();
     //هنا برجع الاوبجكت بتاعي في شكل ماب بناءا علي الجسون بتاعتي واحولها لي لستة
     return characters.map((character) =>Character.fromJson(character)).toList();
   }

   Future<List<Quotes>> getAllCharactersQuotes(String charName) async{
     //هنا عملت متغير وحينتظر البيانات الجاية من ال ويب سيرفز
     final quotes = await charactersWebServices!.getAllCharactersQuotes(charName);
     //هنا برجع الاوبجكت بتاعي في شكل ماب بناءا علي الجسون بتاعتي واحولها لي لستة
     return quotes.map((charQuotes) =>Quotes.fromJson(charQuotes )).toList();
   }
}