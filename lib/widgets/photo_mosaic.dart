import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotoMosaic extends StatelessWidget {
  final List<File> images;

  const PhotoMosaic({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return const Center(child: Text("Nenhuma foto adicionada"));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final file = images[index];
          final image = Image.file(file);
          return FutureBuilder<Size>(
            future: _getImageSize(file),
            builder: (context, snapshot) {
              double height = 100;
              if (snapshot.hasData) {
                final size = snapshot.data!;
                height = size.width > size.height ? 80 : 160;
              }
              return Container(
                height: height,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.antiAlias,
                child: image,
              );
            },
          );
        },
      ),
    );
  }

  Future<Size> _getImageSize(File file) async {
    final decoded = await decodeImageFromList(await file.readAsBytes());
    return Size(decoded.width.toDouble(), decoded.height.toDouble());
  }
}
