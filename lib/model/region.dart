import 'package:pokedex_app/model/pokemon.dart';

class Region {
  String name;
  String image;
  List<Pokemon> pokemonList;

  Region(
    {
      required this.name,
      required this.image,
      required this.pokemonList
    }
  );
}