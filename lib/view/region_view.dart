import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex_app/model/pokemon.dart';
import 'package:pokedex_app/model/region.dart';

import 'pokemon_list_view.dart';

class RegionView extends StatefulWidget {
  const RegionView({super.key});

  @override
  State<RegionView> createState() => _RegionViewState();
}

class _RegionViewState extends State<RegionView> {
  late List<Region> regionList;

  final box = GetStorage();
  
  @override
  void initState() {
    super.initState();
    regionList = [];
    addData();
    initStorage();
  }

  void addData() {
    regionList.add(Region(
      name: "관동", image: "images/gen1.png",
      pokemonList: [
        Pokemon(number: 1, name: "이상해씨", image: "images/gen1_1.png"),
        Pokemon(number: 4, name: "파이리", image: "images/gen1_2.png"),
        Pokemon(number: 7, name: "꼬부기", image: "images/gen1_3.png"),
        Pokemon(number: 144, name: "프리져", image: "images/gen1_4.png")
      ]
    ));
    regionList.add(Region(
      name: "성도", image: "images/gen2.png",
      pokemonList: [
        Pokemon(number: 152, name: "치코리타", image: "images/gen2_1.png"),
        Pokemon(number: 155, name: "브케인", image: "images/gen2_2.png"),
        Pokemon(number: 158, name: "리아코", image: "images/gen2_3.png"),
        Pokemon(number: 244, name: "앤테이", image: "images/gen2_4.png")
      ]
    ));
    regionList.add(Region(
      name: "호연", image: "images/gen3.png",
      pokemonList: [
        Pokemon(number: 252, name: "나무지기", image: "images/gen3_1.png"),
        Pokemon(number: 255, name: "아차모", image: "images/gen3_2.png"),
        Pokemon(number: 258, name: "물짱이", image: "images/gen3_3.png"),
        Pokemon(number: 384, name: "레쿠쟈", image: "images/gen3_4.png")
      ]
    ));
    regionList.add(Region(
      name: "신오", image: "images/gen4.png",
      pokemonList: [
        Pokemon(number: 387, name: "모부기", image: "images/gen4_1.png"),
        Pokemon(number: 390, name: "불꽃숭이", image: "images/gen4_2.png"),
        Pokemon(number: 393, name: "팽도리", image: "images/gen4_3.png"),
        Pokemon(number: 484, name: "펄기아", image: "images/gen4_4.png")
      ]
    ));
    regionList.add(Region(
      name: "하나", image: "images/gen5.png",
      pokemonList: [
        Pokemon(number: 495, name: "주리비얀", image: "images/gen5_1.png"),
        Pokemon(number: 498, name: "뚜꾸리", image: "images/gen5_2.png"),
        Pokemon(number: 501, name: "수댕이", image: "images/gen5_3.png"),
        Pokemon(number: 643, name: "레시라무", image: "images/gen5_4.png")
      ]
    ));
    regionList.add(Region(
      name: "칼로스", image: "images/gen6.png",
      pokemonList: [
        Pokemon(number: 650, name: "도치마론", image: "images/gen6_1.png"),
        Pokemon(number: 653, name: "푸호꼬", image: "images/gen6_2.png"),
        Pokemon(number: 656, name: "개구마르", image: "images/gen6_3.png"),
        Pokemon(number: 717, name: "이벨타르", image: "images/gen6_4.png")
      ]
    ));
    regionList.add(Region(
      name: "알로라", image: "images/gen7.png",
      pokemonList: [
        Pokemon(number: 722, name: "나몰빼미", image: "images/gen7_1.png"),
        Pokemon(number: 725, name: "냐오불", image: "images/gen7_2.png"),
        Pokemon(number: 728, name: "누리공", image: "images/gen7_3.png"),
        Pokemon(number: 791, name: "솔가레오", image: "images/gen7_4.png")
      ]
    ));
    regionList.add(Region(
      name: "가라르", image: "images/gen8.png",
      pokemonList: [
        Pokemon(number: 810, name: "흥나숭", image: "images/gen8_1.png"),
        Pokemon(number: 813, name: "염버니", image: "images/gen8_2.png"),
        Pokemon(number: 816, name: "울머기", image: "images/gen8_3.png"),
        Pokemon(number: 980, name: "무한다이노", image: "images/gen8_4.png")
      ]
    ));
    regionList.add(Region(
      name: "팔데아", image: "images/gen9.png",
      pokemonList: [
        Pokemon(number: 906, name: "나오하", image: "images/gen9_1.png"),
        Pokemon(number: 909, name: "뜨아거", image: "images/gen9_2.png"),
        Pokemon(number: 912, name: "꾸왁스", image: "images/gen9_3.png"),
        Pokemon(number: 1007, name: "코라이돈", image: "images/gen9_4.png")
      ]
    ));
  }

  void initStorage() {
    box.write("_regionName", "");
    box.write("_pokemons", "");
  }

  @override
  void dispose() {
    box.erase();
    super.dispose();
  }

  ///// 화면구성 ////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[600],
        title: Text('Pickachu님의 전국도감',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.contain,
            ),
          ),
        
        
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 0.8
            ), 
            itemCount: regionList.length,
            itemBuilder: (context, index) {
              return _buildGridItem(index);
            },
          ),
        ),
      )
    );
  }
  // ==================== [분리된 함수] ====================

  // 1. Card에 GestureDetector를 입히는 함수
  Widget _buildGridItem(int index) {
    return GestureDetector(
      onTap: () => _onRegionTap(index), // GetX 이동 함수 호출
      child: _buildCard(index),
    );
  }

  // 2. Card 위젯을 만드는 함수
  Widget _buildCard(int index) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              regionList[index].image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Text(
              regionList[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 3. GetX를 활용한 페이지 이동 함수 (context 필요 없음)
  void _onRegionTap(int index) {
    saveStorage(index);
    Get.to(() => PokemonListView());
  }

  // Storage에 데이터 저장
  void saveStorage(int index) {
    box.write("_regionName", regionList[index].name);
    final pokemonMapList = regionList[index].pokemonList.map(
      (pokemon) {
        return {
          "number": pokemon.number,
          "name": pokemon.name,
          "image": pokemon.image
        };
      },
    ).toList();
    box.write("_pokemons", pokemonMapList);
  }
}
