import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_api/models/pokeds_models.dart';

class SearchPage extends StatefulWidget {
  final PokemonModel? pokedex;
  const SearchPage({Key? key, this.pokedex}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Pokemon> _pokemons = [];
  Set _searchedPokemons = {};
  @override
  void initState() {
    super.initState();
    _pokemons = widget.pokedex!.pokemon!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: TextFormField(
          decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onChanged: (v) {
            _searchedPokemons.clear();
            for (Pokemon pokemon in _pokemons ) {
              if (v.length == 0) {
                _searchedPokemons.clear();
                setState(() {});
              } else if (pokemon.name!.toLowerCase().contains(v)) {
                _searchedPokemons.add(pokemon);
                setState(() {});
              }
            }
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("${_searchedPokemons.toList()[index].name}"),
                subtitle: SizedBox(
                  height: 250,
                  child: Image.network(
                    _searchedPokemons.toList()[index].img.toString(),
                  ),
                ),
              ),
            );
          },
          itemCount: _searchedPokemons.length,
        ),
      ),
    );
  }
}
