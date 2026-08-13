import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pokemon_list_view.dart';

class RegionView extends StatefulWidget {
  const RegionView({super.key});

  @override
  State<RegionView> createState() => _RegionViewState();
}

class _RegionViewState extends State<RegionView> {
   // ★ LoginView에서 전달받은 로그인 ID 저장
  late String loginId;


  // ★ RegionView가 처음 실행될 때 ID 받아오기
  @override
  void initState() {
    super.initState();

    // ★ LoginView의 arguments: loginId 값을 받아옴
    loginId = Get.arguments;
  }
  // ㅡMap으로 만드는게 더 간단
  List<Map<String, String>> regionList = [
    {'name': '관동지방', 'image': 'images/gen1.png'},
    {'name': '성도지방', 'image': 'images/gen2.png'},
    {'name': '호연지방', 'image': 'images/gen3.png'},
    {'name': '신오지방', 'image': 'images/gen4.png'},
    {'name': '하나지방', 'image': 'images/gen5.png'},
    {'name': '칼로스지방', 'image': 'images/gen6.png'},
    {'name': '알로라지방', 'image': 'images/gen7.png'},
    {'name': '가라르지방', 'image': 'images/gen8.png'},
    {'name': '팔데아지방', 'image': 'images/gen9.png'},
  ];



  ///// 화면구성 ////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFE53935), 
        foregroundColor: Colors.white,
        toolbarHeight: 70,
        title: Text('$loginId님의 전국도감',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.contain,
            ),
          ),
        
        
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                childAspectRatio: 0.9), 
              itemCount: regionList.length,
              itemBuilder: (context, index) {
                return _buildGridItem(regionList[index]);
              },
            ),
          ),
        ),
      )
    );
  }
  // ==================== [분리된 함수] ====================

  // 1. Card에 GestureDetector를 입히는 함수
  Widget _buildGridItem(Map<String, String> region) {
    return GestureDetector(
      onTap: () => _onRegionTap(region['name']!), // GetX 이동 함수 호출
      child: _buildCard(region),
    );
  }

  // 2. Card 위젯을 만드는 함수
  Widget _buildCard(Map<String, String> region) {
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
              region['image']!,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              region['name']!,
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
  void _onRegionTap(String regionName) {
    Get.to(() => PokemonListView());
  }
}

  
