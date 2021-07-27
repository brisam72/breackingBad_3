import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:bloc_breacking_3/data_layer/models/character.dart';
import 'package:bloc_breacking_3/data_layer/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late  List<Character> characters = [];

  CharactersCubit(
    this.charactersRepository,
  ) : super(CharactersInitial());

  List<Character> getallcharacters() {
    charactersRepository.getAllCharacters().then((charcters) {
      emit(CharactersLoaded(charcters));
      this.characters = charcters;
    });

    return characters;
  }
}
