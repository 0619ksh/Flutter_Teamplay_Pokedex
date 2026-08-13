// 포켓몬 상세 정보 TabBar
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokedex_app/view/detail_view.dart';
import 'package:pokedex_app/view/image_view.dart';

class DetailTabbarView extends StatefulWidget {
  const DetailTabbarView({super.key});

  @override
  State<DetailTabbarView> createState() => _DetailTabbarViewState();
}

class _DetailTabbarViewState extends State<DetailTabbarView> with SingleTickerProviderStateMixin {
  // Properties
  late TabController tabController;
  late String pokemonName;

  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    loadStorage();
  }

  void loadStorage() {
    pokemonName = box.read("_name") ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemonName),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.black,
          tabs: [
            Tab(
              icon: Icon(Icons.crop_original),
            ),
            Tab(
              icon: Icon(Icons.info_outline),
            )
          ]
        ),
      ),

      body: TabBarView(
        controller: tabController,
        children: [
          ImageView(),
          DetailView()
        ]
      ),
    );
  }
}