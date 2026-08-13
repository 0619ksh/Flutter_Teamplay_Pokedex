// 포켓몬 정보
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  // Properties
  late String pokemonName;
  late int pokemonNumber;

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    loadStorage();
  }
  
  void loadStorage() {
    pokemonName = box.read("_name") ?? '';
    pokemonNumber = box.read("_number") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("선택 포켓몬 : $pokemonName"),
            Text("도감번호 : $pokemonNumber"),
          ],
        ),
      ),
    );
  }
}