part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}


// ignore: must_be_immutable
class CharactersLoaded extends CharactersState {
  List<Character> characters;
  CharactersLoaded(
     this.characters,
  );
}
