// 포켓몬 이미지
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  // Properties
  late String pokemonImage;

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    loadStorage();
  }

  void loadStorage() {
    pokemonImage = box.read("_image") ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(pokemonImage),
      ),
    );
  }
}