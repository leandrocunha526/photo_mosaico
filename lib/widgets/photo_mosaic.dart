import 'dart:io';
import 'package:flutter/material.dart';

class PhotoMosaic extends StatelessWidget {
  final List<File> images;

  const PhotoMosaic({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const Center(child: Text("Nenhuma foto adicionada"));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // ajusta para 2 colunas
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return Image.file(images[index], fit: BoxFit.cover);
      },
    );
  }
}
