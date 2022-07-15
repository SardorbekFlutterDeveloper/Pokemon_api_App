import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_api/models/pokeds_models.dart';

class PokemonService {
  static Future<PokemonModel> getAll() async {
    Response res = await Dio().get(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    return PokemonModel.fromJson(jsonDecode(res.data));
  }
}
