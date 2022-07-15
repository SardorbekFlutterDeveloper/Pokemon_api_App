import 'package:flutter/material.dart';
import 'package:pokedex_api/models/pokeds_models.dart';

import 'package:pokedex_api/views/info_page.dart';
import 'package:pokedex_api/views/pokedex_home.dart';
import 'package:pokedex_api/views/search_page.dart';

class Routes {
  static final Routes _instance = Routes._init();
  static Routes get instance => _instance;
  Routes._init();

  Route? onGenerateRoute(RouteSettings setteings) {
    var args = setteings.arguments;
    switch (setteings.name) {
      case "/":
        return simpleRoute(
          const PokedexHome(),
        );
      case "/info":
        return simpleRoute(
          InfoPage(
            pokemon: (args as Pokemon),
          ),
        );
    
      case "/search":
        return simpleRoute(
          SearchPage(
            pokedex: (args as PokemonModel),
          ),
        );
    }
  }

  simpleRoute(Widget route) {
    return MaterialPageRoute(builder: (context) => route);
  }
}
