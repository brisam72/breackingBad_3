import 'package:bloc_breacking_3/business_logic_layer/cubit/characters_cubit.dart';
import 'package:bloc_breacking_3/constans/strings.dart';
import 'package:bloc_breacking_3/data_layer/models/character.dart';
import 'package:bloc_breacking_3/data_layer/repository/characters_repository.dart';
import 'package:bloc_breacking_3/data_layer/web_services/characters_webservices.dart';
import 'package:bloc_breacking_3/presntion_layer/screens/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'characters_details.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRout(RouteSettings settings) {
    switch (settings.name) {
      case charctresscreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => charactersCubit,
                  child: CharactersScreens(),
                ));

      case charactersDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen(character: character,));
    }
  }
}
