// ★ 수집한 포켓몬 목록

import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/model/region.dart';

class CollectingList extends StatefulWidget {
  // ★ 관동 ~ 팔데아 전체 지방 리스트
  final List<Region> regionList;

  // ★ 잡은 포켓몬 도감 번호 리스트
  final List<int> caughtPokemonNumbers;

  const CollectingList({
    super.key,
    required this.regionList,
    required this.caughtPokemonNumbers,
  });

  @override
  State<CollectingList> createState() => _CollectingListState();
}

class _CollectingListState extends State<CollectingList> {
  // Property

  // ★ 잡은 포켓몬만 저장할 리스트
  late List<Pokemon> collectedPokemonList;

  @override
  void initState() {
    super.initState();

    // ★ 처음에는 빈 리스트
    collectedPokemonList = [];

    // ★ 수집한 포켓몬 찾기
    addCollectedPokemon();
  }

  // ★ 관동 ~ 팔데아의 모든 포켓몬을 확인
  // 잡은 포켓몬 번호와 일치하면 collectedPokemonList에 추가
  void addCollectedPokemon() {
    for (Region region in widget.regionList) {
      for (Pokemon pokemon in region.pokemonList) {
        if (widget.caughtPokemonNumbers.contains(pokemon.number)) {
          collectedPokemonList.add(pokemon);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        toolbarHeight: 70,

        title: const Text(
          '수집한 포켓몬',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // ★ 아직 잡은 포켓몬이 없을 경우
      body: collectedPokemonList.isEmpty
          ? const Center(
              child: Text(
                '아직 수집한 포켓몬이 없습니다.',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )

          // ★ 잡은 포켓몬이 있을 경우
          : Padding(
              padding: const EdgeInsets.all(8.0),

              child: ListView.builder(
                itemCount: collectedPokemonList.length,

                itemBuilder: (context, index) {
                  final pokemon = collectedPokemonList[index];

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      8,
                      0,
                      0,
                    ),

                    child: SizedBox(
                      height: 120,

                      child: Card(
                        elevation: 3,

                        color: index % 2 == 0
                            ? Theme.of(context)
                                .colorScheme
                                .primaryContainer
                            : Theme.of(context)
                                .colorScheme
                                .tertiaryContainer,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),

                          child: Row(
                            children: [
                              // ★ 포켓몬 이미지
                              SizedBox(
                                width: 100,

                                child: Image.asset(
                                  pokemon.image,
                                ),
                              ),

                              const SizedBox(
                                width: 20,
                              ),

                              const SizedBox(
                                width: 20,
                              ),

                              // ★ 포켓몬 이름
                              Text(
                                pokemon.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}