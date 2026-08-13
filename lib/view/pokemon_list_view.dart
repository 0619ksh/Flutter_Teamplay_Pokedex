// 지역 별 포켓몬 목록
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/view/detail_tabbar_view.dart';

class PokemonListView extends StatefulWidget {
  const PokemonListView({super.key});

  @override
  State<PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<PokemonListView> {
  // Properties
  late String regionName;
  late List<Pokemon> pokemonList;

  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    loadStorage();
  }

  void loadStorage() {
    regionName = box.read("_regionName") ?? '';
    final data = box.read("_pokemons") ?? [];

    pokemonList = (data as List).map(
      (item) => Pokemon(
        number: item["number"] ?? 0,
        name: item["name"] ?? '',
        image: item["image"] ?? ''
      ),
    ).toList();
  }

  @override
  void dispose() {
    box.erase();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$regionName지방",
          style: TextStyle(
            fontSize: 30
          ),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        toolbarHeight: 70,
      ),

      body: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              saveStorage(index);
              Get.to(DetailTabbarView());
            },
            child: SizedBox(
              height: 120,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(pokemonList[index].image),
                      Text(
                        "     ${pokemonList[index].name}",
                        style: TextStyle(
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Functions
  void saveStorage(int index) {
    box.write("_number", pokemonList[index].number);
    box.write("_name", pokemonList[index].name);
    box.write("_image", pokemonList[index].image);
  }
}