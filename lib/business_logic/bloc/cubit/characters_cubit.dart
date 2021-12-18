import 'package:bloc/bloc.dart';
import 'package:breaking_bad_series/data/models/character_model.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());
}
