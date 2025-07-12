import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:screenshot/screenshot.dart';

class PhotoMosaic extends StatefulWidget {
  final List<File> images;
  final ScreenshotController screenshotController;

  const PhotoMosaic({
    super.key,
    required this.images,
    required this.screenshotController,
  });

  @override
  State<PhotoMosaic> createState() => _PhotoMosaicState();
}

class _PhotoMosaicState extends State<PhotoMosaic> {
  int manualCrossAxisCount = 2;
  final int defaultColumns = 2;

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return const Center(child: Text("Tire fotos para adicionar ao mosaico"));
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = 0.0;
    final crossAxisCount = manualCrossAxisCount;
    final totalSpacing = (crossAxisCount - 1) * spacing;
    final itemWidth = (screenWidth - totalSpacing) / crossAxisCount;

    return Column(
      children: [
        Expanded(
          child: Screenshot(
            controller: widget.screenshotController,
            child: MasonryGridView.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                final file = widget.images[index];
                return FutureBuilder<Size>(
                  future: _getImageSize(file),
                  builder: (context, snapshot) {
                    double height = itemWidth;
                    if (snapshot.hasData) {
                      final size = snapshot.data!;
                      height = itemWidth * (size.height / size.width);
                    }
                    return Dismissible(
                      key: ValueKey(file.path),
                      direction: DismissDirection.horizontal,
                      background: Container(
                        color: Colors.redAccent,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      secondaryBackground: Container(
                        color: Colors.redAccent,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        final removedFile = widget.images[index];
                        setState(() {
                          widget.images.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text("Foto removida"),
                            action: SnackBarAction(
                              label: "Desfazer",
                              onPressed: () {
                                setState(() {
                                  widget.images.insert(index, removedFile);
                                });
                              },
                            ),
                          ),
                        );
                      },
                      child: GestureDetector(
                        onTap: () => _openPhotoView(context, file),
                        child: SizedBox(
                          width: itemWidth,
                          height: height,
                          child: Image.file(file, fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const Text("Colunas"),
              Expanded(
                child: Slider(
                  value: manualCrossAxisCount.toDouble(),
                  min: 1,
                  max: 4,
                  divisions: 3,
                  label: "$manualCrossAxisCount",
                  onChanged: (val) {
                    setState(() {
                      manualCrossAxisCount = val.round();
                    });
                  },
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    manualCrossAxisCount = defaultColumns;
                  });
                },
                icon: const Icon(Icons.refresh),
                label: Text("Reset ($defaultColumns)"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _openPhotoView(BuildContext context, File file) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: PhotoView(
                imageProvider: FileImage(file),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3,
                enableRotation: true,
                backgroundDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  Future<Size> _getImageSize(File file) async {
    final decoded = await decodeImageFromList(await file.readAsBytes());
    return Size(decoded.width.toDouble(), decoded.height.toDouble());
  }
}
